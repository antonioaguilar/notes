Sublime Editor
==============


### Default (OSX).sublime-keymap
```
[
  { "keys": ["shift+alt+up"], "command": "swap_line_up" },
  { "keys": ["shift+alt+down"], "command": "swap_line_down" },
	{ "keys": ["super+d"], "command": "duplicate_line" },
	{ "keys": ["super+shift+o"], "command": "show_overlay", "args": {"overlay": "goto", "show_files": true} },
	{ "keys": ["super+1"], "command": "toggle_side_bar" },
	{ "keys": ["alt+up"], "command": "expand_region" },
	{ "keys": ["alt+down"], "command": "expand_region", "args": {"undo": true}, "context": [{ "key": "expand_region_soft_undo" }]},
	{ "keys": ["super+backspace"], "command": "run_macro_file", "args": {"file": "res://Packages/Default/Delete Line.sublime-macro"} },
	{ "keys": ["alt+m"], "command": "markdown_preview", "args": {"target": "browser", "parser":"markdown"} },
	{ "keys": ["super+alt+l"], "command": "htmlprettify" }
]

```

### Preferences.sublime-settings

```
{
	"bold_folder_labels": true,
	"color_scheme": "Packages/User/SublimeLinter/Monokai JSON+ (SL).tmTheme",
	"create_window_at_startup": false,
	"ensure_newline_at_eof_on_save": true,
	"folder_exclude_patterns":
	[
		".svn",
		".git",
		".hg",
		"CVS",
		".idea",
		"node_modules",
		"production",
		"public",
		"karma",
		"reports"
	],
	"font_size": 12,
	"highlight_line": true,
	"highlight_modified_tabs": true,
	"ignored_packages":
	[
		"Vintage"
	],
	"line_padding_bottom": 1,
	"open_files_in_new_window": false,
	"tab_size": 2,
	"translate_tabs_to_spaces": true,
	"trim_trailing_white_space_on_save": true,
	"word_wrap": true
}

```
