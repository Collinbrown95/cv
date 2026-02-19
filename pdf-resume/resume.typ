#import "@preview/dovenv:0.1.0": parse-env
#import "@preview/fontawesome:0.6.0": *

// Read and parse the .env file
#let env = parse-env(read(".env"))

#let phone = env.at("PHONE_NUM")
#let email = env.at("EMAIL")

// Load your data
#let data = yaml("resume-data.yml")

#set page(paper: "us-letter", margin: (x: 1in, y: 0.8in))
#set text(font: "New Computer Modern Math", size: 11pt)

#let overview = (
  first_name: "Collin",
  last_name: "Brown",
  title: "Sr. Data Architect / Technical Advisor",
  degrees: "M.Sc. Candidate, Computer Science • M.A. Economics",
  linkedin: "https://www.linkedin.com/in/collin-brown-499a4580/",
  github: "https://github.com/Collinbrown95",
  cv: "https://collinbrown95.github.io/resume/",
  profile_img: "img/collin-profile-pic-1.png" // Ensure this file exists in your folder
)

// Helper function to keep icon and text aligned
#let local-contact(img-path, content, url, clr: black) = {
  grid(
    columns: (12pt, auto),
    column-gutter: 6pt,
    align: horizon,
    image(img-path, width: 10pt),
    link(url)[#text(fill: clr)[#content]]
  )
}

#let local-contact-no-link(img-path, content, url, clr: black) = {
  grid(
    columns: (12pt, auto),
    column-gutter: 6pt,
    align: horizon,
    image(img-path, width: 10pt),
    [#text[#content]]
  )
}


// --- ABOUT SECTION ---
#block(width: 100%)[
  #stack(
    dir: ttb,
    spacing: 1.2em,
    
    // Header Grid: Photo, Name/Title, and Contact Info
    grid(
      columns: (80pt, 1fr, auto), // Three distinct columns
      column-gutter: 20pt,
      align: horizon,            // Vertically center all three columns
      
      // Column 1: Circular Photo
      box(
        clip: true,
        radius: 50%,
        stroke: 0.5pt + gray.lighten(50%),
        image(overview.profile_img, width: 80pt, height: 80pt)
      ),
      
      // Column 2: Name, Title, and Degrees
      stack(
        dir: ttb,
        spacing: 0.5em,
        
        text(size: 24pt, weight: "bold")[
          #text(fill: black)[#overview.first_name]
          #text(fill: rgb("#2d5a27"))[ #overview.last_name]
        ],
        text(size: 11pt, weight: "medium", style: "italic")[#overview.title],
        text(size: 9pt, fill: gray.darken(20%))[#overview.degrees],
      ),
      
      // Column 3: Contact Info & Socials (Right Aligned)
      align(right + horizon)[
        #set text(size: 9pt)
        #stack(
          dir: ttb,
          spacing: 0.6em,
          
          
          // Contact info in Black
          local-contact-no-link("img/phone-icon.png", phone, "tel:" + phone),
          local-contact-no-link("img/mail-icon.png", email, "mailto:" + email),
          
          // Socials in Brand Color
          local-contact("img/linkedin.png", "LinkedIn", overview.linkedin, clr: blue.darken(20%)),
          local-contact("img/github.png", "GitHub", overview.github, clr: blue.darken(20%)),
          local-contact("img/cv.png", "CV", overview.cv, clr: blue.darken(20%)),
        )
      ]
    ),
    
    // Overview Content (Equivalent to {{ .Content }})
    [
      #line(length: 100%, stroke: 0.5pt + gray.lighten(50%))
      #v(0.5em)
      #text(hyphenate: true)[
        Proven Data Engineering and Data Architecture expertise. Track record of successful delivery of complex data-driven projects in large enterprise settings.
      ]
    ]
  )
]

#v(1em)

// Experience Section
== Experience
#line(length: 100%, stroke: 0.5pt)

#for job in data.jobs [
  // Use a simple box or grid without overlapping code/markup delimiters
  #grid(
    columns: (1fr, auto),
    [*#job.title* at #job.company], 
    [#job.date]
  )
  #job.details
  #v(0.5em)
]

// Skills section
// 1. Define the reusable skill-item
#let skill-item(name, icon-path) = {
  grid(
    columns: (14pt, 1fr), // Icon gets 14pt, Name takes the rest
    column-gutter: 6pt,   // Space between icon and name
    align: horizon,       // Vertically center them
    image(icon-path, width: 12pt, height: 12pt), // Icon
    text(size: 8pt)[#name]                      // Name
  )
}

== Skills
#line(length: 100%, stroke: 0.5pt)
#v(0.5em)

// 2. Your list of skills (Name, Icon Path)
#let my-skills = data.skills

// 3. The 5-column grid
#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 15pt,
  // Spread the array, calling our function for each pair
  ..my-skills.map(s => skill-item(s.at(0), s.at(1)))
)

// Helper for Compact Education entries
#let edu-item(icon-path, school, degree, details: "") = {
  grid(
    columns: (16pt, 1fr),
    column-gutter: 6pt,
    align: top + left,
    // Small icon for the institution
    box(
        clip: true,
        radius: 50%,
        stroke: 0.5pt + gray.lighten(50%),
        image(icon-path, width: 15pt, height: 15pt)
      ),
    stack(
      dir: ttb,
      spacing: 2pt,
      // School Name (Small & Bold)
      text(weight: "bold", size: 8pt)[#school],
      // Degree (Accent Color)
      text(size: 7pt, fill: rgb("#2d5a27"), weight: "medium")[#degree],
      // Supporting details (Very small & Gray)
      if details != "" { 
        text(size: 7.5pt, fill: gray.darken(40%), style: "italic")[#details] 
      }
    )
  )
}

#v(1em) // Gap from previous section
== Education
#line(length: 100%, stroke: 0.5pt)
#v(0.2em)

#grid(
  columns: (1fr, 1.1fr, 1.2fr), // Adjusted widths to prevent text wrapping
  column-gutter: 12pt,
  
  // Georgia Tech
  edu-item(
    "img/gatech.png",
    "Georgia Tech",
    "M.Sc. Candidate, Computer Science",
    details: "Specialization in AI"
  ),
  
  // Queen's
  edu-item(
    "img/queens.png",
    "Queen's University",
    "M.A., Economics",
    details: "Specialization in Econometrics"
  ),
  
  // McMaster/Athabasca
  edu-item(
    "img/mcmaster.png",
    "McMaster University",
    "B.A., Economics",
    details: "Minor in Mathematics and Statistics"
  )
)

#v(1em)
#text(size: 5pt, style: "italic", fill: gray)[
  Icons provided by Icons8, DevIcon, and Azure Icons.
]