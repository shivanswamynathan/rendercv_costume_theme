// EducationEntry.typ
// This file defines the template for education entries in the CV document.

#let educationentry = (entry) => block[
    // Render the institution name
    set text(font: uservars.bodyfont, size: uservars.fontsize, weight: "bold")
    entry.institution
    v(0.5em)
    
    // Render the degree and area of study
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    entry.studyType + " in " + entry.area
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