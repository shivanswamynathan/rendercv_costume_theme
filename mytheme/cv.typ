// cv.typ
// This file contains the CV template components.

#let cvheading = (cvdata, uservars) => block[
    // Render the name
    set text(font: uservars.headingfont, size: 1.5em, weight: "bold")
    cvdata.personal.name
    v(0.5em)
    
    // Render the titles
    for title in cvdata.personal.titles [
        set text(font: uservars.headingfont, size: 1.2em)
        title
        v(0.5em)
    ]
    
    // Render the contact information
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    "Email: " + cvdata.personal.email
    v(0.5em)
    "Phone: " + cvdata.personal.phone
    v(0.5em)
    "Website: " + cvdata.personal.url
]

// Function to render CV sections
#let cvsection = (section_title, entries, entry_type) => block[
    sectionbeginning(section_title, entry_type)
    for entry in entries [
        showentry(entry, entry_type)
        // Add vertical space between entries
        v(uservars.vertical_space_between_entries)
    ]
    sectionending(section_title, entry_type)
]

// Function to show entry based on type
#let showentry = (entry, entry_type) => {
    if entry_type == "education" {
        educationentry(entry)
    } else if entry_type == "experience" {
        experienceentry(entry)
    } else if entry_type == "bullet" {
        bulletentry(entry)
    } else if entry_type == "numbered" {
        numberedentry(entry, entry.index)
    } else if entry_type == "oneline" {
        onelineentry(entry)
    } else if entry_type == "publication" {
        publicationentry(entry)
    } else if entry_type == "reversednumbered" {
        reversednumberedentry(entry, entry.index)
    } else {
        normalentry(entry)
    }
}