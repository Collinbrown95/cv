// Load your data
#let data = yaml("resume-data.yml")

#set page(paper: "us-letter", margin: (x: 1in, y: 0.8in))
#set text(font: "Linux Libertine", size: 11pt)

// Example of a circular profile photo
#box(
  clip: true,
  radius: 50%, // Makes it a circle
  stroke: 1pt + gray, // Optional border
  image("./collin-profile-pic-1.png", width: 80pt, height: 80pt)
)

#v(1em)

// Experience Section
== Professional Experience
#line(length: 100%, stroke: 0.5pt)

#for job in data.jobs [
  // Use a simple box or grid without overlapping code/markup delimiters
  #grid(
    columns: (1fr, auto),
    [*#job.title* at #job.company], 
    [#job.date]
  )
  #for detail in job.details [
    - #detail
  ]
  #v(0.5em)
]
