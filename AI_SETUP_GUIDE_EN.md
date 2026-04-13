# Setup Guide for Working with Claude Code and GitHub Copilot

This document explains what files and folders a repository needs to work correctly with Claude Code and GitHub Copilot. It is independent of any specific project.

---

## 1. Recommended Minimum Structure

```
my-project/
├── .github/
│   └── copilot-instructions.md   ← instructions for GitHub Copilot
├── CLAUDE.md                     ← instructions for Claude Code
└── README.md                     ← general project description
```

With just these three files, both AIs have enough context to start helping you.

---

## 2. Files and Their Purpose

### `.github/copilot-instructions.md`
Tells GitHub Copilot how to behave inside the repository.

**What to include:**
- Project purpose (one or two lines)
- Folder structure with a description of each part
- Code conventions (language, style, tools)
- Examples of natural language requests and the code Copilot should generate
- Specific rules: what to do, what to avoid

**When Copilot reads it:** automatically every time you open the repository in VS Code with the GitHub Copilot extension installed.

---

### `CLAUDE.md`
Tells Claude Code how to behave inside the repository.

**What to include:**
- Project purpose
- Main commands to run, build, or test the project
- Relevant folder structure
- Important conventions or restrictions

**When Claude reads it:** automatically when starting a session in the project directory.

---

### `README.md`
General project documentation. Read by both AIs and humans.

**What to include:**
- Project description
- Prerequisites
- Usage commands
- Project structure

---

## 3. Preparation

1. Create the repository on GitHub.
2. Clone it locally and open in VS Code.
3. Create the `.github/` folder in the root.
4. Create the three files: `CLAUDE.md`, `.github/copilot-instructions.md`, `README.md`.
5. Fill each file with the project context (see section 2).
6. Commit and push.

**Required VS Code extensions:**
- GitHub Copilot
- Claude Code (if used as an extension)

---

## 4. Execution

### With GitHub Copilot
- Open the Copilot chat (`Ctrl+Alt+I`) and type your request in natural language.
- Copilot will read `copilot-instructions.md` to understand the context before responding.
- It also suggests code in the editor as you type (autocomplete).

### With Claude Code
- Open the terminal at the project root.
- Run `claude` to start a session.
- Claude will automatically read `CLAUDE.md` and have project context from the start.

---

## 5. Expected Result

When the files are properly configured:

| Situation | What happens |
|---|---|
| You ask to create a file or script | The AI generates code consistent with the project style |
| You ask to run a command | The AI uses the commands documented in `README.md` or `CLAUDE.md` |
| You ask to add a feature | The AI respects the defined folder structure |
| The AI suggests something incorrect | Update `copilot-instructions.md` or `CLAUDE.md` with more context |

---

## 6. Tips

- **Be specific in your instructions:** the more detail `CLAUDE.md` and `copilot-instructions.md` have, the fewer corrections you will need to make.
- **Include real examples:** one example of a request + expected response is worth more than a paragraph of explanation.
- **Keep the files up to date:** if you change the project structure, update these files as well.
- **Do not put complete code** inside the instructions; reference the project files instead.
