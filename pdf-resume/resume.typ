#import "@preview/dovenv:0.1.0": parse-env

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
  degrees: "MSc Candidate Computer Science, MA Economics",
  linkedin: "https://www.linkedin.com/in/collin-brown-499a4580/",
  github: "https://github.com/Collinbrown95",
  cv: "https://collinbrown95.github.io/resume/",
  profile_img: "img/collin-profile-pic-1.png" // Ensure this file exists in your folder
)

// --- ABOUT SECTION ---
#block(width: 100%)[
  #stack(
    dir: ttb,
    spacing: 1.2em,
    
    // Header Grid: Photo on left, Text on right
    grid(
      columns: (80pt, 1fr),
      gutter: 20pt,
      align: horizon + left,
      
      // Circular Photo (Avatar)
      box(
        clip: true,
        radius: 50%,
        stroke: 0.5pt + gray.lighten(50%),
        image(overview.profile_img, width: 80pt, height: 80pt)
      ),
      
      // Name, Title, and Socials
      stack(
        dir: ttb,
        spacing: 0.5em,
        
        // Split Styling for Name
        text(size: 26pt, weight: "bold")[
          #text(fill: black)[#overview.first_name]
          #text(fill: rgb("#2d5a27"))[ #overview.last_name]
        ],
        
        // Credentials
        text(size: 12pt, weight: "medium", style: "italic")[#overview.title],
        text(size: 10pt, fill: gray)[#overview.degrees],
        
        // Social Links (using text for simplicity, or FontAwesome icons)
        text(size: 9pt, fill: blue.darken(20%))[
          #link(overview.linkedin)[LinkedIn] | #link(overview.github)[GitHub] | #link(overview.cv)[CV] |
        ],
        text(size: 9pt, fill: black)[
          #phone  #email
        ]
      )
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

#v(1em)
#text(size: 6pt, style: "italic", fill: gray)[
  Icons provided by Icons8, DevIcon, and Azure Icons.
] 