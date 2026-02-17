import yaml
from jinja2 import Environment, FileSystemLoader

# 1. Load your Hugo resume data
with open("content/resume.yaml", "r") as f:
    data = yaml.safe_load(f)

# 2. Set up Jinja2 to handle LaTeX-friendly delimiters
env = Environment(
    block_start_string='[*', block_end_string='*]',
    variable_start_string='((', variable_end_string='))',
    loader=FileSystemLoader('.')
)

template = env.get_template('template.tex')
rendered_tex = template.render(data)

# 3. Save and compile
with open("resume_generated.tex", "w") as f:
    f.write(rendered_tex)

# Use a subprocess to run pdflatex or tectonic (recommended)
import subprocess
subprocess.run(["tectonic", "resume_generated.tex"])
