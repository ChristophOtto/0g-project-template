---
name: refactor-module
description: Guidelines for safely refactoring a module or file
---

# Skill: Refactor a Module

Use this skill when asked to refactor, restructure, or clean up a module or file.

## Steps

1. **Understand before touching**
   - Read the entire file first
   - Identify all callers/importers with a search before changing any public API
   - Note any tests that cover this module

2. **Plan the change — explain first**
   - State what you will change and why, before making any edits
   - If renaming exports or changing signatures, list all affected files

3. **Make the refactor**
   - Change one thing at a time (rename, extract, move — not all at once)
   - Do not change behaviour — refactoring means same output, cleaner code
   - Preserve existing comments unless they are now wrong

4. **Verify**
   - After refactoring, check that all imports still resolve
   - Run existing tests: `npm run test` or equivalent
   - If tests fail, fix them — do not delete them

5. **Do not**
   - Change a file's public API without updating all callers
   - Combine a refactor with a feature change in the same commit
   - Overwrite a file without showing the diff first

## Commit format

```
refactor(<scope>): <short description of what was restructured>
```
