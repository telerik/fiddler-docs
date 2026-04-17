---
name: telerik-docs-style-guide
description: "Audit and fix any Progress/Telerik docs-builder documentation against the full Progress DevTools Style Guide. Use this skill when asked to improve documentation quality, apply style guide rules, audit docs for compliance, fix tone/voice/formatting issues, or standardize metadata across any Telerik, Kendo UI, or Progress product docs repo. Creates a phased plan with progress tracking."
tools:
  - read_file
  - replace_string_in_file
  - multi_replace_string_in_file
  - create_file
  - grep_search
  - file_search
  - semantic_search
  - list_dir
  - run_in_terminal
  - manage_todo_list
  - fetch_webpage
---

# Telerik Documentation Style Guide Compliance Skill

## Purpose

This skill audits and remediates any Progress/Telerik documentation repository against the **Progress DevTools Style Guide**. It is product-agnostic — it discovers the product name and structure from the repository itself.

## When to Use

- "Audit this documentation for style guide compliance"
- "Fix the tone and voice of these docs"
- "Apply the Telerik style guide to this repo"
- "Standardize the metadata across all articles"
- "Check formatting consistency"
- "Make this documentation compliant with the Progress style guide"

## Prerequisites

- The target repository uses **docs-builder** technology (`docs-builder.yml`, `slug://` links, YAML front-matter).
- The full style guide is available at <https://www.telerik.com/documentation/style-guide/>.

## Instructions

Load the full agent instructions from the companion [AGENT.md](./AGENT.md) file in this folder. That file contains:

1. The complete phased plan (6 phases, 100+ individual checklist items).
2. Detailed rules from every style guide article.
3. Technology assumptions for docs-builder.

Follow the AGENT.md instructions to execute the audit and remediation.

## Quick-Reference Rules

The most frequently violated rules, for quick scanning:

| # | Rule | Fix |
|---|------|-----|
| 1 | "simply", "it's easy" | Remove |
| 2 | "please note", "please" | Remove |
| 3 | "e.g." / "i.e." | → "for example," / "that is," |
| 4 | "should" | → "have to" / "need to" / "must" |
| 5 | "could" / "would" | → "can" / "will" |
| 6 | Passive voice | → Active voice |
| 7 | "click on X" | → "click X" |
| 8 | "tap on X" | → "tap X" |
| 9 | UI elements not bold | → **bold** |
| 10 | Code refs not monospace | → `monospace` |
| 11 | Missing `meta_title` | Add with product context |
| 12 | Missing `description` | Add 100–150 char action-driven description |
| 13 | Heading capitalization | Apply Title Case rules |
| 14 | Non-parallel list items | Make parallel |
| 15 | Ambiguous contractions | Expand (it's → it is, you'll → you will) |
| 16 | "since version X" | → "starting with version X" |
| 17 | "disabled" / "grayed out" | → "unavailable" |
| 18 | Missing image alt text | Add descriptive alt |
| 19 | "this"/"that" as pronouns | → "this option"/"that feature" (add noun) |
| 20 | Missing Oxford comma | Add serial comma |
