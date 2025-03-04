// NumberedEntry.typ
// This file defines the template for numbered entries in the CV document.

#let numberedentry = (entry, index) => block[
    // Render the entry number and content
    index + ". " + entry.content
]