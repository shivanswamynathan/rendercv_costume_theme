// utils.typ
// This file contains utility functions for the CV document.

// Function to format date range
#let daterange = (start, end) => {
    if end == "present" {
        start + " - Present"
    } else {
        start + " - " + end
    }
}

// Function to format a single date
#let strpdate = (date) => {
    date
}