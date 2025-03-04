// ReversedNumberedEntry.typ
// This file defines the template for reversed numbered entries in the CV document.

#let reversednumberedentry = (entry, index) => block[
    // Render the entry number and content in reverse order
    index + ". " + entry.content
]