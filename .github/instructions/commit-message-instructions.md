# Commit Message Guidelines

When generating commit messages, please adhere to the following guidelines to ensure consistency and clarity:

1. **Use conventional commits format**:

   ```text
   <type>(<scope>): <subject>
   <BLANK LINE>
   <body>
   <BLANK LINE>
   <footer>
   ```

2. **Types**: Mandatory, one of `feat`, `fix` or `docs`
3. **Scope**: Mandatory, one of `specs`, `project`
4. **Subject**: A brief summary of the change, written in the imperative mood (e.g., "fix bug" not "fixed bug" or "fixes bug"). Do not capitalize the first letter and avoid ending with a period.
5. **Body**: Optional, but if included, should provide a synthetic explanation of the change, maximum 5 lines. Use the imperative, present tense.
6. **Footer**: Optional, but if included, should reference any breaking changes or issues closed by the commit.
7. **Breaking Changes**: If the commit introduces a breaking change, include a `BREAKING CHANGE:` followed by a space or two newlines in the footer with a description of the change.
8. **Line Length**: Keep lines in the commit message to a maximum of 100 characters for better readability.
