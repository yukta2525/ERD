# ERD Repository (bigER + VS Code)

This repository is for students to submit Entity‑Relationship Diagrams (ERDs) using the bigER VS Code extension.

## Prerequisites
- VS Code installed
- Git installed and a GitHub account
- Java 11+ runtime (JDK recommended)
- VS Code extension: BIGER Modeling Tool 


## Submission 
You will submit your ERD by submitting your remote repository url 

1) Create your ERD in VS Code
- Ensure bigER extension is installed and Java works: `java -version` shows 11+.
- Create a file at the repo root, for example: `Firstname_Lastname.erd`.
- Follow instructions in class to create your model using your own business rules. Save the model in the file `Firstname_Lastname.erd` (replace with your name)
- You can view/Open the diagram from the editor toolbar or press Ctrl/⌘+O. 

2) Push your files back to your remote repo. Copy your repo URL and submit via assignment setup for class. 


## Optional: Git one‑time setup (only if you plan to use Git locally)
Run once in a VS Code terminal:
```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Notes
- Place your `.erd` file(s) at the repository root when working locally.
- Keep filenames consistent with the convention `Firstname_Lastname.erd` unless instructed otherwise.

## Troubleshooting
- bigER inactive or no diagram: ensure the file ends with `.erd` and the extension is enabled.
- Java not found: install JDK 11+ (see above) and restart VS Code.
