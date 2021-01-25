# Visual Studio Code

## Custom Editor Settings

```json
{
    "editor.fontSize": 14,
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.scrollBeyondLastLine": false,
    "editor.minimap.enabled": false,
    "explorer.openEditors.visible": 0,
    "workbench.sideBar.location": "left",
    "workbench.activityBar.visible": false,
    "workbench.editor.showIcons": true,
    "workbench.editor.enablePreview": false,
    "workbench.startupEditor": "newUntitledFile",
    "files.insertFinalNewline": true,
    "files.trimFinalNewlines": true,
    "files.trimTrailingWhitespace": true,
    "files.exclude": {
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true,
        "**/.idea": true,
        "**/.vscode": true,
        "**/.DS_Store": true,
        "**/package-lock.json": true,
        "**/node_modules": true,
        "**/dist": true,
        "**/production": true,
        "**/public": true,
        "**/vendor": true
    },
    "terminal.external.osxExec": "iTerm.app",
    "zenMode.fullScreen": false,
    "telemetry.enableCrashReporter": false,
    "telemetry.enableTelemetry": false,
    "update.showReleaseNotes": false,
    "html.format.extraLiners": "",
    "window.zoomLevel": 0
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
  }
]
```

## VSCode Key Bindings (Windows)

```json
[
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
