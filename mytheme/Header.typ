// Header.typ
// This file defines the header layout for the CV document.

#let header = (cvdata, uservars) => block[
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