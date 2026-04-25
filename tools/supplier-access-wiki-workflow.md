# Supplier Access Applet Wiki Workflow

This document outlines the standard operating procedure (SOP) for creating high-quality, standardized documentation for "Supplier Access" applets. Follow these prompts and steps to ensure consistency across the BigLedger wiki.

---

## Phase 1: Research & Structural Drafting

**Goal**: Understand the applet's unique functionality and draft the core sections from the supplier's perspective.

### Prompt 1: Initial Creation
> "Create comprehensive documentation for **[APPLET NAME]** following the exact format and structure of **@claim-applet.md**. 
> 
> **Instructions**:
> 1. Refer to the normal internal applet **@[INTERNAL APPLET WIKI]** for business logic and content.
> 2. **CRITICAL**: Ensure the wiki is written entirely from the **perspective of the client's supplier**.
> 3. Explore the repository at **@[REPO PATH]** to:
>    - Identify main features from routing/menu files.
>    - Check component files for unique UI elements (e.g., collaboration tabs, RMA links).
>    - Find translation files for specific labels.
> 4. Include 'Who Benefits?' (at least 3 roles), 'What Problems Does This Solve?', and a 'Key Features Overview' using the cards shortcode."

---

## Phase 2: Premium Formatting (The "Gold Standard")

**Goal**: Enhance the documentation with visual aids, structural tables, and role-specific guides to match the "gold standard" wikis.

### Prompt 2: Review & Polish
> "Review **@[NEW APPLET WIKI]** and perform the following enhancements:
> 
> 1. **Framework Consistency**: Compare against **@claim-applet.md** and add:
>    - An 'Understanding the [Applet] Framework' table (Who/What/How).
>    - A 'Hierarchy Structure' ASCII tree showing the data flow.
>    - A 'Golden Trio' table (Analogy, Definition, System Impact).
> 2. **Quick Start Expansion**: Create role-specific Quick Start guides (e.g., For Supplier Warehouse, For Supplier Support, For Supplier Accounts) with 'Goal' and numbered steps.
> 3. **Status Lifecycle**: Add a table explaining the 'Document Status Lifecycle' (e.g., Draft vs. Final vs. Settled) from the supplier's viewpoint.
> 4. **Tone Check**: Ensure the language is premium, professional, and benefit-oriented."

---

## Phase 3: Visual Integration

**Goal**: Add screenshots and diagrams to make the documentation intuitive.

### Prompt 3: Screenshot Addition & Mapping
> "I need to add screenshots to **@[NEW APPLET WIKI]**. 
> 
> **Instructions**:
> 1. **Check Reusability**: Check the screenshots in `static/images/[INTERNAL-APPLET-NAME]/` and see if they can be reused for the Supplier Access version.
> 2. **Capture/Copy**: 
>    - Create a new directory: `static/images/[SUPPLIER-APPLET-NAME]/`.
>    - Copy reused images or capture new ones from akaun.cloud for: Main listing, View/Edit form, Line items, and Settings.
> 3. **Shortcode Integration**: Add `{{< figure >}}` shortcodes to the documentation in appropriate sections using this format:
>    `{{< figure src="/images/[applet-name]/[name].png" alt="[Desc]" caption="[Caption]" >}}`"

---

## Section Checklist
Every Supplier Access wiki should contain:
- [ ] **Frontmatter**: title, description, tags, weight.
- [ ] **Purpose and Overview**: Clear "Core Concept" callout.
- [ ] **Who Benefits?**: Specific supplier roles.
- [ ] **What Problems Does This Solve?**: Focus on transparency and speed.
- [ ] **Key Features Overview**: Both `cards` shortcode and sub-sections.
- [ ] **Key Concepts**: Framework table, ASCII Hierarchy, and the "Golden Trio".
- [ ] **Quick Start Guide**: At least 2-3 role-specific workflows.
- [ ] **Feature Deep Dive**: Detailed explanation of technical features (e.g., RMA links).
- [ ] **Configuration & Settings**: What the supplier sees vs. admin controls.
- [ ] **FAQ**: At least 4 practical, scenario-based questions.
