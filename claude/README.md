# Skills and Tools

## Skills

```bash
npx skills add better-auth/skills -y

npx skills add google-labs-code/stitch-skills -y

npx get-shit-done-cc@latest -y

npx skills@latest add mattpocock/skills/write-a-prd -y
npx skills@latest add mattpocock/skills/prd-to-plan -y
npx skills@latest add mattpocock/skills/prd-to-issues -y
npx skills@latest add mattpocock/skills/grill-me -y
npx skills@latest add mattpocock/skills/request-refactor-plan -y
```

## Claude Settings

```json
{
  "includeCoAuthoredBy": false,
  "permissions": {
    "allow": [
      "Bash(date:*)",
      "Bash(echo:*)",
      "Bash(cat:*)",
      "Bash(ls:*)",
      "Bash(mkdir:*)",
      "Bash(wc:*)",
      "Bash(head:*)",
      "Bash(tail:*)",
      "Bash(sort:*)",
      "Bash(grep:*)",
      "Bash(tr:*)",
      "Bash(git add:*)",
      "Bash(git commit:*)",
      "Bash(git status:*)",
      "Bash(git log:*)",
      "Bash(git diff:*)",
      "Bash(git tag:*)",
      "Bash(git add:*)",
      "Bash(git rm:*)",
      "Bash(git commit:*)",
      "Bash(git checkout:*)",
      "Bash(git push:*)",
      "Bash(gh pr create:*)"
    ],
    "defaultMode": "acceptEdits"
  },
  "enabledPlugins": {
    "frontend-design@claude-plugins-official": false,
    "code-simplifier@claude-plugins-official": true,
    "superpowers@claude-plugins-official": true,
    "typescript-lsp@claude-plugins-official": true,
    "explanatory-output-style@claude-plugins-official": true,
    "greptile@claude-plugins-official": true
  },
  "skipDangerousModePermissionPrompt": true,
  "suppressWelcomeMessage": true,
  "showWelcomeBanner": false
}
```
