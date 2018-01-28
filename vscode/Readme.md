# Visual Studio Code

## Custom Editor Settings

```json
{
  "editor.fontSize": 14,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "files.exclude": {
    "**/.git": true,
    "**/.svn": true,
    "**/.hg": true,
    "**/.idea": true,
    "**/.vscode": true,
    "**/node_modules": true,
    "**/dist": true,
    "**/production": true,
    "**/public": true,
    "**/vendor": true,
    "**/.DS_Store": true
  },
  "window.zoomLevel": 0,
  "editor.minimap.enabled": false,
  "editor.scrollBeyondLastLine": false,
  "explorer.openEditors.visible": 0,
  "workbench.sideBar.location": "left",
  "workbench.activityBar.visible": true,
  "workbench.editor.showIcons": false,
  "workbench.editor.enablePreview": false,
  "workbench.startupEditor": "newUntitledFile",
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "terminal.external.osxExec": "iTerm.app",
  "zenMode.fullScreen": false,
  "telemetry.enableCrashReporter": false,
  "telemetry.enableTelemetry": false,
  "workbench.colorTheme": "Monokai",

  "html.format.extraLiners": "",
  "html-css-class-completion.includeGlobPattern": "**/*.{css,scss,html}"
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
  }
]

```
