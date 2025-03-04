// TextEntry.typ
// This file defines the template for text entries in the CV document.

#let textentry = (entry) => block[
    // Render the entry title
    set text(font: uservars.bodyfont, size: uservars.fontsize, weight: "bold")
    entry.title
    v(0.5em)
    
    // Render the entry content
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    entry.content
]