// PublicationEntry.typ
// This file defines the template for publication entries in the CV document.

#let publicationentry = (entry) => block[
    // Render the publication title
    set text(font: uservars.bodyfont, size: uservars.fontsize, weight: "bold")
    entry.title
    v(0.5em)
    
    // Render the publication details
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    "Published in " + entry.publisher + ", " + strpdate(entry.releaseDate)
    v(0.5em)
    
    // Render the highlights
    for highlight in entry.highlights [
        - highlight
    ]
]