// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]