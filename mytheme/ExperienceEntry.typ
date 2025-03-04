// ExperienceEntry.typ
// This file defines the template for experience entries in the CV document.

#let experienceentry = (entry) => block[
    // Render the organization and position
    set text(font: uservars.bodyfont, size: uservars.fontsize, weight: "bold")
    entry.organization
    v(0.5em)
    set text(font: uservars.bodyfont, size: uservars.fontsize, style: "italic")
    entry.position
    v(0.5em)
    
    // Render the dates
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    daterange(entry.startDate, entry.endDate)
    v(0.5em)
    
    // Render the highlights
    for highlight in entry.highlights [
        - highlight
    ]
]