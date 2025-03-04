// BulletEntry.typ
// This file defines the template for bullet entries in the CV document.

#let bulletentry = (entry) => block[
    // Render the bullet point
    - entry.content
]