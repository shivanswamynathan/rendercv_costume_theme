"""
The `rendercv.data.models.design` module contains the data model of the `design` field
of the input file.
"""

import importlib
import importlib.util
import os
import pathlib
from typing import Annotated, Any

import pydantic

from ...themes import (
    ClassicThemeOptions,
    EngineeringclassicThemeOptions,
    EngineeringresumesThemeOptions,
    ModerncvThemeOptions,
    Sb2novThemeOptions,
    AcademiaThemeOptions,
    MythemeThemeOptions,
)
from . import entry_types
from .base import RenderCVBaseModelWithoutExtraKeys

# ======================================================================================
# Create validator functions: ==========================================================
# ======================================================================================


def validate_design_options(
    design: Any,
    available_theme_options: dict[str, type],
    available_entry_type_names: list[str],
) -> Any:
    """Chech if the design options are for a built-in theme or a custom theme. If it is
    a built-in theme, validate it with the corresponding data model. If it is a custom
    theme, check if the necessary files are provided and validate it with the custom
    theme data model, found in the `__init__.py` file of the custom theme folder.

    Args:
        design: The design options to validate.
        available_theme_options: The available theme options. The keys are the theme
            names and the values are the corresponding data models.
        available_entry_type_names: The available entry type names. These are used to
            validate if all the templates are provided in the custom theme folder.

    Returns:
        The validated design as a Pydantic data model.
    """
    from .rendercv_data_model import INPUT_FILE_DIRECTORY

    original_working_directory = pathlib.Path.cwd()

    # Change the working directory to the input file directory:

    if isinstance(design, tuple(available_theme_options.values())):
        # Then it means it is an already validated built-in theme. Return it as it is:
        return design
    if design["theme"] in available_theme_options:
        # Then it is a built-in theme, but it is not validated yet. Validate it and
        # return it:
        ThemeDataModel = available_theme_options[design["theme"]]
        return ThemeDataModel(**design)
    # It is a custom theme. Validate it:
    theme_name: str = str(design["theme"])

    # Custom theme should only contain letters and digits:
    if not theme_name.isalnum():
        message = "The custom theme name should only contain letters and digits."
        raise ValueError(
            message,
            "theme",  # this is the location of the error
            theme_name,  # this is value of the error
        )

    if INPUT_FILE_DIRECTORY is None:
        theme_parent_folder = pathlib.Path.cwd()
    else:
        theme_parent_folder = INPUT_FILE_DIRECTORY

    custom_theme_folder = theme_parent_folder / theme_name

    # Check if the custom theme folder exists:
    if not custom_theme_folder.exists():
        message = (
            (
                f"The custom theme folder `{custom_theme_folder}` does not exist."
                " It should be in the working directory as the input file."
            ),
        )
        raise ValueError(
            message,
            "",  # this is the location of the error
            theme_name,  # this is value of the error
        )

    # Check if all the necessary files are provided in the custom theme folder:
    if all((custom_theme_folder / (entry_type_name + ".j2.typ")).exists() for entry_type_name in available_entry_type_names):
        required_entry_files = [
            custom_theme_folder / (entry_type_name + ".j2.typ")
            for entry_type_name in available_entry_type_names
        ]
        required_files = [
            custom_theme_folder / "SectionBeginning.j2.typ",  # section beginning template
            custom_theme_folder / "SectionEnding.j2.typ",  # section ending template
            custom_theme_folder / "Preamble.j2.typ",  # preamble template
            custom_theme_folder / "Header.j2.typ",  # header template
            *required_entry_files,
        ]
    else:
        required_entry_files = [
            custom_theme_folder / (entry_type_name + ".typ")
            for entry_type_name in available_entry_type_names
        ]
        # Here you can define the required files dynamically based on your requirements
        dynamic_required_files = ["cv.typ", "template.typ", "utils.typ","Preamble.typ","Header.typ","SectionBeginning.typ","TextEntry.typ","SectionEnding.typ","EducationEntry.typ","BulletEntry.typ","ExperienceEntry.typ","NormalEntry.typ","NumberedEntry.typ","OneLineEntry.typ","PublicationEntry.typ","ReversedNumberedEntry.typ"]
        required_files = [
            custom_theme_folder / file for file in dynamic_required_files
        ] + required_entry_files

    for file in required_files:
        if not file.exists():
            message = (
                f"You provided a custom theme, but the file `{file}` is not"
                f" found in the folder `{custom_theme_folder}`."
            )
            raise ValueError(
                message,
                "",  # This is the location of the error
                theme_name,  # This is value of the error
            )

    # Import __init__.py file from the custom theme folder if it exists:
    path_to_init_file = custom_theme_folder / "__init__.py"

    if path_to_init_file.exists():
        spec = importlib.util.spec_from_file_location(
            "theme",
            path_to_init_file,
        )

        theme_module = importlib.util.module_from_spec(spec)  # type: ignore
        try:
            spec.loader.exec_module(theme_module)  # type: ignore
        except SyntaxError as e:
            message = (
                f"The custom theme {theme_name}'s __init__.py file has a syntax"
                " error. Please fix it."
            )
            raise ValueError(message) from e
        except ImportError as e:
            message = (
                (
                    f"The custom theme {theme_name}'s __init__.py file has an"
                    " import error. If you have copy-pasted RenderCV's built-in"
                    " themes, make sure to update the import statements (e.g.,"
                    ' "from . import" to "from rendercv.themes import").'
                ),
            )

            raise ValueError(message) from e

        ThemeDataModel = getattr(
            theme_module,
            f"{theme_name.capitalize()}ThemeOptions",  # type: ignore
        )

        # Initialize and validate the custom theme data model:
        theme_data_model = ThemeDataModel(**design)
    else:
        # Then it means there is no __init__.py file in the custom theme folder.
        # Create a dummy data model and use that instead.
        class ThemeOptionsAreNotProvided(RenderCVBaseModelWithoutExtraKeys):
            theme: str = theme_name

        theme_data_model = ThemeOptionsAreNotProvided(theme=theme_name)

    os.chdir(original_working_directory)

    return theme_data_model



# ======================================================================================
# Create custom types: =================================================================
# ======================================================================================

available_theme_options = {
    "classic": ClassicThemeOptions,
    "sb2nov": Sb2novThemeOptions,
    "engineeringresumes": EngineeringresumesThemeOptions,
    "engineeringclassic": EngineeringclassicThemeOptions,
    "moderncv": ModerncvThemeOptions,
    "mytheme": MythemeThemeOptions,
}

available_themes = list(available_theme_options.keys())

# Create a custom type named RenderCVBuiltinDesign:
# It is a union of all the design options and the correct design option is determined by
# the theme field, thanks to Pydantic's discriminator feature.
# See https://docs.pydantic.dev/2.7/concepts/fields/#discriminator for more information
RenderCVBuiltinDesign = Annotated[
    ClassicThemeOptions
    | Sb2novThemeOptions
    | EngineeringresumesThemeOptions
    | EngineeringclassicThemeOptions
    | ModerncvThemeOptions
    | MythemeThemeOptions,
    pydantic.Field(discriminator="theme"),
]

# Create a custom type named RenderCVDesign:
# RenderCV supports custom themes as well. Therefore, `Any` type is used to allow custom
# themes. However, the JSON Schema generation is skipped, otherwise, the JSON Schema
# would accept any `design` field in the YAML input file.
RenderCVDesign = Annotated[
    pydantic.json_schema.SkipJsonSchema[Any] | RenderCVBuiltinDesign,
    pydantic.BeforeValidator(
        lambda design: validate_design_options(
            design,
            available_theme_options=available_theme_options,
            available_entry_type_names=entry_types.available_entry_type_names,  # type: ignore
        )
    ),
]