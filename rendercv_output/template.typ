#import "@preview/imprecv:1.0.1": *

#import "Preamble.typ"
#import "Header.typ"
#import "cv.typ"
#import "utils.typ"

#let cvdata = yaml("template.yml")

#let uservars = (
    headingfont: "Libertinus Serif",
    bodyfont: "Libertinus Serif",
    fontsize: 10pt,          // https://typst.app/docs/reference/layout/length
    linespacing: 6pt,        // length
    sectionspacing: 0pt,     // length
    showAddress:  true,      // https://typst.app/docs/reference/foundations/bool
    showNumber: true,        // bool
    showTitle: true,         // bool
    headingsmallcaps: false, // bool
    sendnote: false,         // bool
    show_time_spans_in: ["work", "education", "projects"], // example usage
    entries: ["work", "education", "projects", "affiliations", "awards", "certificates", "publications", "skills", "languages", "interests", "references"],
    vertical_space_between_entries: 1em // Define the vertical space between entries
)

// setrules and showrules can be overridden by re-declaring it here
// #let setrules(doc) = {
//      // add custom document style rules here
//
//      doc
// }

#let customrules = (doc) => {
    // add custom document style rules here
    set page(                 // https://typst.app/docs/reference/layout/page
        paper: "us-letter",
        numbering: "1 / 1",
        number-align: center,
        margin: 1.25cm,
    )

    // set list(indent: 1em)

    doc
}

#let cvinit = (doc) => {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}

// each section body can be overridden by re-declaring it here
// #let cveducation = []

// ========================================================================== //

#show: doc => cvinit(doc)

cvheading(cvdata, uservars)
cvsection("Work Experience", cvdata.work, "experience")
cvsection("Education", cvdata.education, "education")
cvsection("Affiliations", cvdata.affiliations, "bullet")
cvsection("Projects", cvdata.projects, "bullet")
cvsection("Awards", cvdata.awards, "bullet")
cvsection("Certificates", cvdata.certificates, "bullet")
cvsection("Publications", cvdata.publications, "publication")
cvsection("Skills", cvdata.skills, "bullet")
cvsection("Languages", cvdata.languages, "bullet")
cvsection("Interests", cvdata.interests, "bullet")
cvsection("References", cvdata.references, "bullet")
endnote(uservars)