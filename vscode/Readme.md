# Visual Studio Code

## Custom Editor Settings

```json
{
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.scrollBeyondLastLine": false,
  "editor.minimap.enabled": false,
  "explorer.openEditors.visible": 0,
  "workbench.editor.showIcons": true,
  "workbench.editor.enablePreview": false,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "files.exclude": {
    "**/.cache": true,
    "**/.DS_Store": true,
    "**/.git": true,
    "**/.gitignore": true,
    "**/.hg": true,
    "**/.idea": true,
    "**/.svn": true,
    "**/.terraform*": true,
    "**/.vscode": true,
    "**/package-lock.json": true,
    "**/production": true,
    "**/vendor": true,
    "**/.claude": true,
    "**/.tanstack": true,
    "**/dist": true,
    "**/node_modules": true,
    "**/bun.lock": true,
    "**/coverage": true,
    "terraform.tfstate*": true
  },
  "terminal.external.osxExec": "iTerm.app",
  "zenMode.fullScreen": false,
  "telemetry.editStats.enabled": false,
  "telemetry.feedback.enabled": false,
  "telemetry.telemetryLevel": "off",
  "telemetry.editStats.details.enabled": false,
  "update.showReleaseNotes": false,
  "html.format.extraLiners": "",
  "extensions.ignoreRecommendations": true,
  "editor.wordWrap": "on",
  "editor.detectIndentation": false,
  "go.useLanguageServer": true,
  "go.toolsManagement.autoUpdate": true,
  "svelte.ask-to-enable-ts-plugin": false,
  "git.openRepositoryInParentFolders": "always",
  "security.workspace.trust.untrustedFiles": "open",
  "editor.copyWithSyntaxHighlighting": false,
  "window.zoomLevel": 2,
  "editor.stickyScroll.enabled": false,
  "editor.unicodeHighlight.nonBasicASCII": false,
  "chat.disableAIFeatures": true,
  "workbench.layoutControl.enabled": false,
  "workbench.editor.showTabs": "multiple",
  "workbench.navigationControl.enabled": false,
  "window.commandCenter": false,
  "workbench.statusBar.visible": false,
  "workbench.startupEditor": "none",
  "workbench.tips.enabled": false,
  "breadcrumbs.enabled": false,
  "workbench.tree.enableStickyScroll": false,
  "workbench.tree.renderIndentGuides": "none",
  "workbench.tree.indent": 16,
  "explorer.compactFolders": false,
  "explorer.confirmDragAndDrop": false,
  "explorer.confirmDelete": false,
  "explorer.decorations.badges": false,
  "git.decorations.enabled": false,
  "editor.colorDecorators": false,
  "editor.codeLens": false,
  "editor.links": false,
  "editor.matchBrackets": "always",
  "editor.parameterHints.enabled": true,
  "editor.lightbulb.enabled": "off",
  "editor.hover.enabled": "on",
  "scm.diffDecorations": "all",
  "editor.lineNumbers": "on",
  "workbench.colorTheme": "Tomorrow Night Blue"
}
```

## Custom Keybindings

```json
[
  {
    "key": "cmd+shift+p",
    "command": "workbench.action.moveEditorToNextGroup"
  },
  {
    "key": "cmd+shift+alt+p",
    "command": "workbench.action.moveEditorToPreviousGroup"
  },
  {
    "key": "cmd+ctrl+up",
    "command": "cursorTop",
    "when": "editorTextFocus"
  },
  {
    "key": "cmd+ctrl+down",
    "command": "cursorBottom",
    "when": "editorTextFocus"
  },
  {
    "key": "cmd+alt+i",
    "command": "workbench.action.terminal.toggleTerminal"
  },
  {
    "key": "cmd+w",
    "command": "workbench.action.closeActiveEditor"
  },
  {
    "key": "cmd+k cmd+w",
    "command": "workbench.action.closeAllEditors"
  },
  {
    "key": "cmd+k w",
    "command": "workbench.action.closeEditorsInGroup"
  },
  {
    "key": "cmd+k f",
    "command": "workbench.action.closeFolder"
  },
  {
    "key": "cmd+k w",
    "command": "workbench.action.closeFolder"
  },
  {
    "key": "shift+cmd+l",
    "command": "-editor.action.selectHighlights",
    "when": "editorFocus"
  },
  {
    "key": "shift+cmd+l",
    "command": "editor.action.formatDocument",
    "when": "editorHasDocumentFormattingProvider && editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly"
  },
  {
    "key": "shift+alt+f",
    "command": "-editor.action.formatDocument",
    "when": "editorHasDocumentFormattingProvider && editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly"
  },
  {
    "key": "shift+cmd+t",
    "command": "-workbench.action.reopenClosedEditor"
  },
  {
    "key": "shift+cmd+t",
    "command": "editor.action.rename",
    "when": "editorHasRenameProvider && editorTextFocus && !editorReadonly"
  },
  {
    "key": "f2",
    "command": "-editor.action.rename",
    "when": "editorHasRenameProvider && editorTextFocus && !editorReadonly"
  },
  {
    "key": "shift+cmd+g",
    "command": "-workbench.action.terminal.findPrevious",
    "when": "terminalFindWidgetFocused"
  },
  {
    "key": "shift+cmd+g",
    "command": "-editor.action.previousMatchFindAction",
    "when": "editorFocus"
  },
  {
    "key": "shift+cmd+g",
    "command": "-workbench.action.terminal.findPreviousTerminalFocus",
    "when": "terminalFocus"
  },
  {
    "key": "shift+cmd+g",
    "command": "editor.action.changeAll",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "cmd+f2",
    "command": "-editor.action.changeAll",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "cmd+1",
    "command": "-workbench.action.focusFirstEditorGroup"
  },
  {
    "key": "cmd+1",
    "command": "workbench.action.toggleSidebarVisibility"
  },
  {
    "key": "cmd+b",
    "command": "-workbench.action.toggleSidebarVisibility"
  },
  {
    "key": "cmd+3",
    "command": "workbench.action.terminal.toggleTerminal"
  }
]
```
