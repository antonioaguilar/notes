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
  "editor.detectIndentation": true,
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
  "workbench.panel.opensMaximized": "always",
  "workbench.remoteIndicator.showExtensionRecommendations": false,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "files.exclude": {
    "**/.cache": true,
    "**/.DS_Store": true,
    "**/.git": true,
    "**/.hg": true,
    "**/.idea": true,
    "**/.nyc": true,
    "**/.svn": true,
    "**/.vscode": true,
    "**/dist": false,
    "**/production": true,
    "**/public": false,
    "**/vendor": true
  },
  "git.openRepositoryInParentFolders": "never",
  "extensions.ignoreRecommendations": true,
  "javascript.updateImportsOnFileMove.enabled": "always",
  "terminal.integrated.fontSize": 12,
  "zenMode.hideStatusBar": true,
  "zenMode.fullScreen": true,
  "telemetry.telemetryLevel": "off",
  "update.showReleaseNotes": false,
  "html.format.extraLiners": "",
  "zig.zls.enabled": "on",
  "svelte.enable-ts-plugin": true,
  "editor.formatOnSave": true,
  "workbench.colorTheme": "Tomorrow Night Blue",
  "terminal.integrated.stickyScroll.enabled": false,
  "workbench.activityBar.location": "top",
  "workbench.layoutControl.enabled": false,
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
