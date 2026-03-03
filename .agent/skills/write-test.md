---
name: write-test
description: Guidelines for writing tests in this project
---

# Skill: Write a Test

Use this skill when asked to write unit or integration tests for a function, module, or feature.

## Steps

1. **Identify what to test**
   - The public interface (inputs and outputs), not internal implementation
   - Edge cases: empty input, null, boundary values, error conditions

2. **Follow the existing test structure**
   - Check if a test directory exists (`/test`, `/tests`, `/__tests__`, `*.test.js`, `*.spec.js`)
   - Match the existing naming convention and framework (Jest, Mocha, Vitest, etc.)

3. **Write the test**
   - One `describe` block per module/function
   - One `it`/`test` block per behaviour
   - Use descriptive names: `it('returns null when input is empty')`
   - AAA pattern: **Arrange** → **Act** → **Assert**

4. **Do not**
   - Write tests that depend on external services without mocking
   - Duplicate tests that already exist
   - Overwrite existing test files without showing a diff first

## Example (Jest)

```js
describe('formatDate', () => {
  it('returns formatted date string for valid input', () => {
    expect(formatDate('2024-01-15')).toBe('15 Jan 2024')
  })

  it('returns null for invalid input', () => {
    expect(formatDate(null)).toBeNull()
  })
})
```
