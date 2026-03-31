# Skills and Tools

## Skills

```bash
# better auth skills
npx skills add better-auth/skills -g -y

# google stitch
npx skills add google-labs-code/stitch-skills -g -y

# framework skills
npx get-shit-done-cc@latest -g -y

# usefult skills
npx skills@latest add mattpocock/skills/write-a-prd -g -y
npx skills@latest add mattpocock/skills/prd-to-plan -g -y
npx skills@latest add mattpocock/skills/prd-to-issues -g -y
npx skills@latest add mattpocock/skills/grill-me -g -y
npx skills@latest add mattpocock/skills/request-refactor-plan -g -y

# debug skills
npx skills add addyosmani/agent-skills@debugging-and-error-recovery -g -y

# superpowers and GSD
superpowers:systematic-debugging
gsd:debug

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
