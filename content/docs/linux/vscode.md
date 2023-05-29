---
title: "VS Code"
date: 2023-04-29
tags: ["linux", "ubuntu", "vscode"]
---

# Things to Do After Installing Ubuntu GNOME 22.04 LTS


## Extensions

~~~shell
code --install-extension BeardedBear.beardedicons
code --install-extension christian-kohler.path-intellisense
code --install-extension DEVSENSE.composer-php-vscode
code --install-extension DEVSENSE.phptools-vscode
code --install-extension DEVSENSE.profiler-php-vscode
code --install-extension diz.ecsstractor-port
code --install-extension formulahendry.vscode-mysql
code --install-extension itsjonq.vs-plus-plus
code --install-extension jakebathman.mysql-syntax
code --install-extension miguelsolorio.fluent-icons
code --install-extension naumovs.color-highlight
code --install-extension nespinozacr.mysql-autocomplete
code --install-extension PKief.material-icon-theme
code --install-extension pranaygp.vscode-css-peek
code --install-extension prasadbobby.auto-rename-tag
code --install-extension qufiwefefwoyn.kanagawa
code --install-extension RapidAPI.vscode-rapidapi-client
code --install-extension rapidapi.vscode-services
code --install-extension ritwickdey.LiveServer
code --install-extension SimonSiefke.svg-preview
code --install-extension solnurkarim.html-to-css-autocompletion
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-german
code --install-extension streetsidesoftware.code-spell-checker-russian
code --install-extension tal7aouy.icons
code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension wayou.vscode-todo-highlight
code --install-extension Yummygum.city-lights-icon-vsc
code --install-extension zhuangtongfa.material-theme
code --install-extension Zignd.html-css-class-completion
~~~

## ~/.config/Code/User/keybindings.json

~~~json
[
  {
      "key": "ctrl+d",
      "command": "-editor.action.addSelectionToNextFindMatch",
      "when": "editorFocus"
  },
  {
      "key": "ctrl+d",
      "command": "editor.action.copyLinesDownAction",
      "when": "editorTextFocus && !editorReadonly"
  },
  {
      "key": "ctrl+shift+alt+down",
      "command": "-editor.action.copyLinesDownAction",
      "when": "editorTextFocus && !editorReadonly"
  }
]
~~~

## ~/.config/Code/User/settings.json

~~~json
{
  "workbench.colorTheme": "Light+ (Plus)",
  "workbench.startupEditor": "newUntitledFile",
  "security.workspace.trust.untrustedFiles": "open",

  "editor.tabSize": 2,
  "editor.wordWrap": "bounded",
  "editor.wrappingIndent": "same",
  "editor.wordWrapColumn": 90,

  // "editor.folding": false,
  "editor.insertSpaces": false,
  "editor.smoothScrolling": true,
  "editor.detectIndentation": true,
  "editor.suggestSelection": "first",
  //Определяет, будет ли редактор прокручиваться за пределы последней строки.
  "editor.scrollBeyondLastLine": true,
  "editor.multiCursorModifier": "ctrlCmd",
  //Определяет, должен ли редактор отображать управляющие символы.
  "editor.renderControlCharacters": false,

  //Appearance
  "editor.bracketPairColorization.enabled": true,
  "editor.glyphMargin": false,
  // "editor.scrollbar.horizontal": "hidden",
  // "editor.scrollbar.vertical": "hidden",
  /*    "workbench.colorCustomizations": {
                "editorOverviewRuler.errorForeground": "#0000",
                "editorOverviewRuler.warningForeground": "#0000",
                "editorOverviewRuler.infoForeground": "#0000"
        }, */
  "workbench.iconTheme": "bearded-icons",
  "workbench.productIconTheme": "fluent-icons",
  "workbench.layoutControl.enabled": false,
  "editor.lineHeight": 23,
  "editor.fontSize": 15,
  "editor.minimap.enabled": false,
  "breadcrumbs.enabled": true,

  // "editor.fontFamily": "Iosevka NFM",
  // "editor.fontFamily": "IBM Plex Mono",
  // "editor.fontFamily": "Fira Code",
  // "editor.fontFamily": "Roboto Mono",
  // "editor.fontFamily": "Dank Mono, IBM Plex Mono",
  "editor.fontFamily": "Consolas",
  // "editor.fontFamily": "JetBrains Mono, monospace",
  "editor.inlayHints.fontFamily": "Pragmata Pro",
  "notebook.outputFontFamily": "Pragmata Pro",

  //Terminal
  "terminal.integrated.fontFamily": "Iosevka NFM",
  "terminal.integrated.fontSize": 15,
  "terminal.integrated.tabs.enabled": false,

  //Explorer
  "explorer.confirmDelete": false,
  "explorer.compactFolders": false,
  "explorer.confirmDragAndDrop": false,

/*              //Format
        "prettier.semi": false,
        "prettier.useTabs": true,
        "editor.formatOnSave": true,
        "prettier.singleQuote": true,
        "prettier.jsxSingleQuote": true,
        "editor.codeActionsOnSave": {
                "source.organizeImports": true
        },
        //Включите круглые скобки вокруг единственного параметра функции стрелки
        "prettier.arrowParens": "avoid",
        "editor.defaultFormatter": "esbenp.prettier-vscode",
        "eslint.packageManager": "yarn",
        "files.associations": { "*.scss": "postcss", "*.module.scss": "postcss" },
        "editor.inlineSuggest.enabled": true,
        "[html]": {
                "editor.defaultFormatter": "vscode.html-language-features"
        }, */

  //Breadcrumbs
  "breadcrumbs.icons": false,
  "breadcrumbs.showKeys": false,
  "breadcrumbs.showFiles": false,
  "breadcrumbs.symbolPath": "off",
  "breadcrumbs.showArrays": false,
  "breadcrumbs.showEvents": false,
  "breadcrumbs.showFields": false,
  "breadcrumbs.showClasses": false,
  "breadcrumbs.showMethods": false,
  "breadcrumbs.showBooleans": false,
  "breadcrumbs.showFunctions": false,
  "breadcrumbs.showConstants": false,
  "breadcrumbs.showEnumMembers": false,
  "breadcrumbs.showConstructors": false,

  //JS & TS
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "typescript.preferences.quoteStyle": "single",
  "javascript.preferences.quoteStyle": "single",
  "javascript.format.semicolons": "remove",
  "typescript.format.semicolons": "remove",
  "typescript.suggest.paths": false,
  "javascript.suggest.paths": false,

  //Spell checker
  "cSpell.language": "en,ru,de-de",
  "cSpell.userWords": [],
  "cSpell.enabled": true,
  "cSpell.enableFiletypes": [
    "md",
    "txt",
    "php",
    "tpl",
    "blade",
    "jsx",
    "tsx",
    "ts",
    "js",
    "scss",
    "sass",
    "vue"
  ],

  "files.exclude": {
    "**/.expo": true,
    "**/.expo-shared": true,
    "**/.idea": true,
    "**/.vscode": true,
    "**/.next": true
  },

  "editor.hover.enabled": false,
  "security.workspace.trust.enabled": false,
  "editor.linkedEditing": true,
  "ecsstractor_port.add_comment": false,
  "ecsstractor_port.empty_line_before_nested_selector": false,
  "liveServer.settings.donotShowInfoMsg": true,
  "liveServer.settings.donotVerifyTags": true,
  "files.autoSave": "afterDelay",
  //Управляет выделением символов, которые можно спутать с основными символами ASCII, кроме тех, которые являются общими для текущего пользовательского языкового стандарта.
  "editor.unicodeHighlight.ambiguousCharacters": false,
  "editor.quickSuggestionsDelay": 0
}
~~~