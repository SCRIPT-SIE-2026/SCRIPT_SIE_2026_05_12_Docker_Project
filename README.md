# Reproducible Scientific Project with Docker

This repository is a minimal scientific project used to practice Docker-based reproducibility.

The project contains:

- a Python computation script that generates a figure;
- a LaTeX report that includes the generated figure;
- a `Dockerfile` describing the Python execution environment.

The objective is to make the computation reproducible: another user should be able to rebuild the same environment and regenerate the same output without installing Python packages manually on their machine.

## Project Structure

```text
.
├── Dockerfile
├── README.md
├── .gitignore
├── report
│   └── main.tex
└── src
    └── compute.py
```

Generated files are expected in a `results/` directory:

```text
results/
└── figure.png
```

The `results/` directory is not part of the source code. It is created when running the project.

## What the Project Does

The script [src/compute.py](src/compute.py) performs a simple numerical computation:

1. it creates a vector `x` between 0 and 10;
2. it computes `sin(x)`;
3. it saves the resulting plot as `results/figure.png`.

The report [report/main.tex](report/main.tex) then includes this generated figure.
