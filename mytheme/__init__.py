from pathlib import Path
from typing import Literal, List, Optional
from rendercv.data.models.base import RenderCVBaseModelWithoutExtraKeys

# Define theme options for mytheme
class MythemeThemeOptions(RenderCVBaseModelWithoutExtraKeys):
    theme: Literal["mytheme"]
    show_time_spans_in: Optional[List[str]] = []
    entries: Optional[List[str]] = []

THEME_NAME = "mytheme"
AUTHOR = "Shiva S"
VERSION = "1.0"
DESCRIPTION = "A custom CV theme for RenderCV."

TEMPLATES = {
    "main": "template.typ",  # The primary template file
}

ASSETS = [
    "utils.typ",
    "cv.typ",
    "template.yml",
    "Preamble.typ",
    "Header.typ",
    "SectionBeginning.typ",
    "SectionEnding.typ",
    "TextEntry.typ",
    "EducationEntry.typ",
    "BulletEntry.typ",
    "ExperienceEntry.typ",
    "NormalEntry.typ",
    "NumberedEntry.typ",
    "OneLineEntry.typ",
    "PublicationEntry.typ",
    "ReversedNumberedEntry.typ",
]

def register():
    theme_path = Path(__file__).parent
    return {
        "name": THEME_NAME,
        "author": AUTHOR,
        "version": VERSION,
        "description": DESCRIPTION,
        "templates": {key: theme_path / value for key, value in TEMPLATES.items()},
        "assets": [theme_path / asset for asset in ASSETS],
        "options": MythemeThemeOptions,  
    }