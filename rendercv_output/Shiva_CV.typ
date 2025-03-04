// Preamble.typ
// This file is used to set up the initial document settings and imports.

// Import utility functions
#import "utils.typ"

// Import the CV template
#import "cv.typ"


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

// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

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
#v(design-entries-vertical-space-between-entries)
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

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

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
#v(design-entries-vertical-space-between-entries)
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

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

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
#v(design-entries-vertical-space-between-entries)
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
#v(design-entries-vertical-space-between-entries)
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

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

// NormalEntry.typ
// This file defines the template for normal entries in the CV document.

#let normalentry = (entry) => block[
    // Render the entry title
    set text(font: uservars.bodyfont, size: uservars.fontsize, weight: "bold")
    entry.title
    v(0.5em)
    
    // Render the entry content
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    entry.content
]
#v(design-entries-vertical-space-between-entries)
// NormalEntry.typ
// This file defines the template for normal entries in the CV document.

#let normalentry = (entry) => block[
    // Render the entry title
    set text(font: uservars.bodyfont, size: uservars.fontsize, weight: "bold")
    entry.title
    v(0.5em)
    
    // Render the entry content
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    entry.content
]

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

// OneLineEntry.typ
// This file defines the template for one-line entries in the CV document.

#let onelineentry = (entry) => block[
    // Render the entry content in one line
    entry.content
]
#v(design-entries-vertical-space-between-entries)
// OneLineEntry.typ
// This file defines the template for one-line entries in the CV document.

#let onelineentry = (entry) => block[
    // Render the entry content in one line
    entry.content
]
#v(design-entries-vertical-space-between-entries)
// OneLineEntry.typ
// This file defines the template for one-line entries in the CV document.

#let onelineentry = (entry) => block[
    // Render the entry content in one line
    entry.content
]

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

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

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

// BulletEntry.typ
// This file defines the template for bullet entries in the CV document.

#let bulletentry = (entry) => block[
    // Render the bullet point
    - entry.content
]
#v(design-entries-vertical-space-between-entries)
// BulletEntry.typ
// This file defines the template for bullet entries in the CV document.

#let bulletentry = (entry) => block[
    // Render the bullet point
    - entry.content
]

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

// NumberedEntry.typ
// This file defines the template for numbered entries in the CV document.

#let numberedentry = (entry, index) => block[
    // Render the entry number and content
    index + ". " + entry.content
]
// NumberedEntry.typ
// This file defines the template for numbered entries in the CV document.

#let numberedentry = (entry, index) => block[
    // Render the entry number and content
    index + ". " + entry.content
]
// NumberedEntry.typ
// This file defines the template for numbered entries in the CV document.

#let numberedentry = (entry, index) => block[
    // Render the entry number and content
    index + ". " + entry.content
]

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
// SectionBeginning.typ
// This file defines the beginning of a section for the CV document.

#let sectionbeginning = (section_title, entry_type) => block(width: 100%)[
    // Render the section title
    set text(font: uservars.headingfont, size: 1.2em, weight: "bold")
    section_title
    v(0.5em)
]

// ReversedNumberedEntry.typ
// This file defines the template for reversed numbered entries in the CV document.

#let reversednumberedentry = (entry, index) => block[
    // Render the entry number and content in reverse order
    index + ". " + entry.content
]
// ReversedNumberedEntry.typ
// This file defines the template for reversed numbered entries in the CV document.

#let reversednumberedentry = (entry, index) => block[
    // Render the entry number and content in reverse order
    index + ". " + entry.content
]
// ReversedNumberedEntry.typ
// This file defines the template for reversed numbered entries in the CV document.

#let reversednumberedentry = (entry, index) => block[
    // Render the entry number and content in reverse order
    index + ". " + entry.content
]

// SectionEnding.typ
// This file defines the ending of a section for the CV document.

#let sectionending = (section_title, entry_type) => block(width: 100%)[
    // Render the section ending
    set text(font: uservars.bodyfont, size: uservars.fontsize)
    v(1em)  // Add some vertical space
]
