// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]