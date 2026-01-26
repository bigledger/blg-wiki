# AI-Powered Documentation Guide

> **A Step-by-Step Guide for Non-Technical Team Members**
> 
> Learn how to create professional applet documentation using AI assistance in VS Code/Cursor IDE.

---

## Table of Contents

1. [Prerequisites & Setup](#1-prerequisites--setup)
2. [Clone the Documentation Repository](#2-clone-the-documentation-repository)
3. [Understanding the Documentation Structure](#3-understanding-the-documentation-structure)
4. [Writing Your First Documentation](#4-writing-your-first-documentation)
5. [Prompt Templates](#5-prompt-templates)
6. [Adding Screenshots](#6-adding-screenshots)
7. [Preview Your Changes](#7-preview-your-changes)
8. [Push Your Changes](#8-push-your-changes)
9. [Best Practices](#9-best-practices)

---

## 1. Prerequisites & Setup

### Step 1.1: Download and Install Cursor IDE

Cursor is an AI-powered code editor that makes documentation easy.

1. Go to **[cursor.com](https://cursor.com)**
2. Click **Download** for your operating system (Mac/Windows)
3. Install the application
4. Open Cursor IDE

### Step 1.2: Sign In to Cursor

1. Click on your profile icon (bottom-left)
2. Sign in with Google or GitHub account
3. This enables AI features

### Step 1.3: Install Git (If Not Already Installed)

**For Mac:**
- Open Terminal and type: `git --version`
- If not installed, it will prompt you to install

**For Windows:**
- Download from [git-scm.com](https://git-scm.com)
- Install with default settings

---

## 2. Clone the Documentation Repository

### Step 2.1: Get Repository Access

1. Ask your team lead for access to `bigledger/blg-wiki` repository
2. Make sure you have a GitHub account

### Step 2.2: Clone the Repository

1. Open Cursor IDE
2. Press `Cmd + Shift + P` (Mac) or `Ctrl + Shift + P` (Windows)
3. Type "Git Clone" and select it
4. Paste this URL: `https://github.com/bigledger/blg-wiki.git`
5. Choose a folder to save (e.g., `Documents/Office/Documentation/`)
6. Click "Open" when prompted

### Step 2.3: Open the Project

1. In Cursor: **File → Open Folder**
2. Navigate to `blg-wiki` folder
3. Click **Open**

---

## 3. Understanding the Documentation Structure

### Folder Structure

```
blg-wiki/
├── content/
│   └── en/
│       └── applets/           ← Your documentation goes here
│           ├── claim-applet.md      ← Reference template
│           ├── your-new-applet.md   ← New docs you create
│           └── ...
├── static/
│   └── images/
│       └── applet-name/       ← Screenshots go here
└── ...
```

### Reference File: claim-applet.md

**Location:** `content/en/applets/claim-applet.md`

This is your **gold standard template**. Every new documentation should follow this format:

| Section | Purpose |
|---------|---------|
| Frontmatter (---) | Title, description, tags |
| Purpose and Overview | Who benefits, what problems it solves |
| Key Features Overview | Cards showing main features |
| Key Concepts | Important terms and workflows |
| Quick Start Guide | Step-by-step for different roles |
| Feature Sections | Detailed feature explanations |
| Configuration & Settings | Admin settings documentation |
| FAQ | Common questions |

---

## 4. Writing Your First Documentation

### Step 4.1: Open AI Chat

1. In Cursor, press `Cmd + L` (Mac) or `Ctrl + L` (Windows)
2. This opens the AI chat panel on the right

### Step 4.2: Reference the Template

Before writing any prompt, always tell the AI to use claim-applet.md as reference.

### Step 4.3: Write Your First Prompt

Copy and paste this prompt template, replacing the bracketed items:

---

## 5. Prompt Templates

### 🟢 PROMPT 1: Create New Applet Documentation

```
Create comprehensive documentation for [APPLET NAME] following the exact format and structure of @claim-applet.md

**About the Applet:**
- Purpose: [What does this applet do?]
- Target Users: [Who uses this? e.g., Sales team, HR, Finance]
- Key Features: [List 3-5 main features]

**Requirements:**
1. Follow the same frontmatter format with title, description, and relevant tags
2. Include "Who Benefits from This Applet?" section with at least 3 user roles
3. Include "What Problems Does This Solve?" section
4. Create Key Features Overview with {{< cards >}} shortcode
5. Add Quick Start Guide with role-specific steps
6. Include Configuration & Settings section
7. Add FAQ section with at least 4 questions
8. Use the same writing style and tone

Create the file at: content/en/applets/[applet-name]-applet.md
```

---

### 🟢 PROMPT 2: Add Screenshots to Documentation

```
I need to add screenshots to @[applet-name]-applet.md

Please help me:
1. Navigate to the [APPLET NAME] on akaun.cloud
2. Capture screenshots for:
   - Main listing page
   - Create/Edit form
   - Settings page
   - [Any other specific screens]
3. Save screenshots to static/images/[applet-name]-applet/
4. Add figure shortcodes to the documentation in appropriate sections

Use this format for screenshots:
{{< figure src="/images/[applet-name]-applet/[screenshot-name].png" alt="[Description]" caption="[Caption text]" >}}
```

---

### 🟢 PROMPT 3: Review and Improve Documentation

```
Review @[applet-name]-applet.md and:
1. Compare it against @claim-applet.md for format consistency
2. Check all sections are present
3. Improve any unclear explanations
4. Add missing Quick Start steps
5. Ensure FAQ section has practical questions
6. Rate the documentation quality out of 10

Suggest improvements and implement them.
```

---

### 🟢 PROMPT 4: Create Infographic for Documentation

```
Generate an infographic for [APPLET NAME] that shows:
- The challenges/problems (before using the applet)
- The solution (what the applet provides)
- Who benefits (user roles)

Style: Professional, clean, similar to the claim-applet infographic

Save as: static/images/[applet-name]-applet/[applet-name]-overview-infographic.png

Then add it to the documentation after the Key Features Overview section.
```

---

### 🟢 PROMPT 5: Analyze Repository to Understand Applet

```
I need to create documentation for [APPLET NAME].

Please:
1. Explore the repository at @[repo-path] to understand the applet
2. Look for routing files to identify main features
3. Check component files for UI elements
4. Find any i18n/translation files for labels
5. Summarize the key features you found
6. Then create documentation following @claim-applet.md format
```

---

## 6. Adding Screenshots

### Step 6.1: Let AI Navigate and Capture

Use this prompt:

```
Navigate to [APPLET NAME] on akaun.cloud and capture screenshots for documentation:

1. Go to https://akaun.cloud/#/bigledger/akaun-platform/container/launchpad-panel
2. Click on [APPLET NAME] tile
3. Capture screenshots of:
   - Main listing/dashboard
   - Create form
   - Edit form
   - Settings page
   - Any reports

Save all screenshots to static/images/[applet-name]-applet/
Then add them to the documentation with figure shortcodes.
```

### Step 6.2: Manual Screenshot Upload

If you have your own screenshots:

1. Create folder: `static/images/[applet-name]-applet/`
2. Copy your screenshots there
3. Use naming convention: `feature-name.png` (lowercase, hyphens)
4. Ask AI to add them:

```
Add this screenshot to @[applet-name]-applet.md

Image path: static/images/[applet-name]-applet/[filename].png
Add it under the section: [Section Name]
Caption: [Your caption text]
```

---

## 7. Preview Your Changes

### Step 7.1: Start the Preview Server

Ask AI:

```
Start the Hugo server so I can preview my documentation changes locally
```

Or run manually in terminal:

```bash
cd /path/to/blg-wiki
hugo server
```

### Step 7.2: View in Browser

1. Open browser
2. Go to: **http://localhost:1313**
3. Navigate to your applet documentation
4. Check formatting and images

---

## 8. Push Your Changes

### Step 8.1: Save and Commit

Ask AI:

```
Help me push my documentation changes to the main branch.
Show me the files that will be committed first.
```

### Step 8.2: Or Use These Git Commands

```bash
git add .
git commit -m "docs: Add [applet-name] documentation with screenshots"
git push origin main
```

---

## 9. Best Practices

### ✅ DO:

- Always reference `@claim-applet.md` in your prompts
- Use consistent naming: `[applet-name]-applet.md`
- Add screenshots for visual clarity
- Include Quick Start guides for each user role
- Test your documentation locally before pushing
- Use descriptive alt text for images

### ❌ DON'T:

- Create documentation without referencing the template
- Skip the frontmatter (title, description, tags)
- Leave placeholder text like [TODO] or [ADD HERE]
- Push without previewing locally
- Forget to add the FAQ section

---

## Quick Reference Card

| Task | Prompt Start |
|------|--------------|
| New documentation | "Create comprehensive documentation for [APPLET] following @claim-applet.md..." |
| Add screenshots | "Navigate to [APPLET] and capture screenshots..." |
| Review quality | "Review @[applet]-applet.md and compare against @claim-applet.md..." |
| Create infographic | "Generate an infographic for [APPLET] showing..." |
| Push changes | "Help me push my changes to main branch..." |

---

## Need Help?

If you get stuck:

1. **Ask AI:** "I'm trying to [task] but getting [issue]. How do I fix this?"
2. **Reference the template:** Always mention `@claim-applet.md`
3. **Ask your team lead** for access issues or complex questions

---

*Last Updated: January 2026*
