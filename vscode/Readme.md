# Visual Studio Code

## Custom Editor Settings

```json
{
  "window.zoomLevel": 1.5,
  "window.closeWhenEmpty": true,
  "window.density.editorTabHeight": "default",
  "window.commandCenter": false,
  "window.confirmBeforeClose": "never",
  "chat.extensionTools.enabled": false,
  "chat.disableAIFeatures": true,
  "editor.tabSize": 2,
  "editor.autoIndent": "full",
  "editor.insertSpaces": true,
  "editor.detectIndentation": false,
  "editor.scrollBeyondLastLine": false,
  "editor.minimap.enabled": false,
  "editor.accessibilitySupport": "off",
  "editor.renderControlCharacters": true,
  "editor.stickyScroll.enabled": false,
  "explorer.openEditors.visible": 1,
  "workbench.startupEditor": "none",
  "workbench.sideBar.location": "left",
  "workbench.editor.showIcons": true,
  "workbench.editor.enablePreview": false,
  "workbench.editor.useModal": "off",
  "workbench.panel.opensMaximized": "always",
  "workbench.remoteIndicator.showExtensionRecommendations": false,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "files.exclude": {
    ".claude/": true,
    ".superpowers/": true,
    ".tanstack/": true,
    ".cloudflare/": true,
    "**/.cache": true,
    "**/.DS_Store": true,
    "**/.git": true,
    "**/.gitignore": true,
    "**/.hg": true,
    "**/.idea": true,
    "**/.nyc": true,
    "**/.svn": true,
    "**/.vscode": true,
    "**/dist": true,
    "**/node_modules": true,
    "**/package-lock.json": true,
    "**/production": true,
    "**/public": false,
    "**/vendor": true,
    "bun.lock": true,
    "coverage/": true
  },
  "git.openRepositoryInParentFolders": "never",
  "extensions.ignoreRecommendations": true,
  "js/ts.updateImportsOnFileMove.enabled": "always",
  "terminal.integrated.fontSize": 12,
  "zenMode.hideStatusBar": true,
  "telemetry.telemetryLevel": "off",
  "update.showReleaseNotes": false,
  "html.format.extraLiners": "",
  "svelte.enable-ts-plugin": true,
  "editor.formatOnSave": true,
  "terminal.integrated.stickyScroll.enabled": false,
  "workbench.activityBar.location": "top",
  "workbench.statusBar.visible": false,
  "workbench.layoutControl.enabled": false,
  "zenMode.centerLayout": false,
  "zenMode.hideLineNumbers": false,
  "workbench.editorAssociations": {
    "*.md": "vscode.markdown.preview.editor"
  },
  "workbench.browser.showInTitleBar": true,
  "workbench.preferredLightColorTheme": "Quiet Light",
  "workbench.preferredDarkColorTheme": "Tomorrow Night Blue",
  "multiCommand.commands": [],
  "workbench.colorTheme": "Quiet Light",
}
```

## Custom Keybindings

```json
[
  // SHORTCUT: comment line
  {
    "key": "cmd+/",
    "command": "editor.action.commentLine",
    "when": "editorTextFocus && !editorReadonly"
  },
  // SHORTCUT: toggle light / dark theme
  {
    "key": "cmd+0",
    "command": "workbench.action.toggleLightDarkThemes"
  },
  // SHORTCUT: open / close the internal browser tab
  {
    // OPEN: Only runs when the Simple Browser is NOT the active editor
    "key": "cmd+4",
    "command": "workbench.action.browser.open",
    "when": "activeEditor != 'workbench.editor.browser'"
  },
  {
    // CLOSE: Only runs when the Simple Browser IS the active editor (or focused)
    "key": "cmd+4",
    "command": "workbench.action.closeActiveEditor",
    "when": "activeEditor == 'workbench.editor.browser' || webviewFocus"
  },
  // SHORTCUT: toggle devtools inside internal browser
  {
    "key": "alt+cmd+i",
    "command": "workbench.action.browser.toggleDevTools"
  },
  // SHORTCUT: toggle split code view
  {
    // if in the first group, move to the next (second) group
    "key": "shift+cmd+p",
    "command": "workbench.action.moveEditorToNextGroup",
    "when": "activeEditorGroupIndex == 1"
  },
  {
    // if in any group other than the first, move to the previous (first) group
    "key": "shift+cmd+p",
    "command": "workbench.action.moveEditorToPreviousGroup",
    "when": "activeEditorGroupIndex != 1"
  },
  // SHORTCUT:
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
  // SHORTCUT: close active editor
  {
    "key": "cmd+w",
    "command": "workbench.action.closeActiveEditor"
  },
  // SHORTCUT: format code / document
  {
    "key": "shift+cmd+l",
    "command": "editor.action.formatDocument",
    "when": "editorHasDocumentFormattingProvider && editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly"
  },
  {
    "key": "shift+cmd+t",
    "command": "editor.action.rename",
    "when": "editorHasRenameProvider && editorTextFocus && !editorReadonly"
  },
  {
    "key": "shift+cmd+g",
    "command": "editor.action.changeAll",
    "when": "editorTextFocus && !editorReadonly"
  },
  // SHORTCUT: toggle sidebar
  {
    "key": "cmd+1",
    "command": "workbench.action.toggleSidebarVisibility"
  },
  // SHORTCUT: open/close new search editor tab
  {
    "key": "cmd+2",
    "command": "search.action.openNewEditorFromView",
    "when": "activeEditor != 'workbench.editor.searchEditor'"
  },
  {
    "key": "cmd+2",
    "command": "workbench.action.closeActiveEditor",
    "when": "activeEditor == 'workbench.editor.searchEditor'"
  },
  // SHORTCUT: toggle terminal (full tab view)
  {
    "key": "cmd+3",
    "command": "workbench.action.terminal.toggleTerminal"
  },
  // LIST OF DISABLED COMMANDS
  {
    // Remove the default binding for cmd+4
    "key": "cmd+4",
    "command": "-workbench.action.focusFourthEditorGroup"
  },
  {
    // disable the default Command Palette shortcut to avoid conflicts
    "key": "shift+cmd+p",
    "command": "-workbench.action.showCommands"
  },
  {
    "key": "shift+cmd+l",
    "command": "-editor.action.selectHighlights",
    "when": "editorFocus"
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
    "key": "cmd+f2",
    "command": "-editor.action.changeAll",
    "when": "editorTextFocus && !editorReadonly"
  },
]
```
