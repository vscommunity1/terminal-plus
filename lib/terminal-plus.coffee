StatusBar = require './status-bar'

module.exports = TerminalPlus =
  statusBar: null

  activate: (state) ->
    @statusBar = new StatusBar(state.statusBarState)

  deactivate: ->
    @statusBar.destroy()

  config:
    toggles:
      type: 'object'
      order: 1
      properties:
        cursorBlink:
          title: 'Cursor Blink'
          description: 'Should the cursor blink when the terminal is active?'
          type: 'boolean'
          default: true
        windowAnimations:
          title: 'Window Animations'
          description: 'Do you want the panel to transition on open and on hide?'
          type: 'boolean'
          default: true
    core:
      type: 'object'
      order: 2
      properties:
        autoRunCommand:
          title: 'Auto Run Command'
          description: 'Command to run on terminal initialization.'
          type: 'string'
          default: ''
        scrollback:
          title: 'Scroll Back'
          description: 'How many lines of history should be kept?'
          type: 'integer'
          default: 1000
        shell:
          title: 'Shell Override'
          description: 'Override the default shell instance to launch.'
          type: 'string'
          default: do ->
            switch process.platform
              when 'win32'
                path = require 'path'
                path.resolve(process.env.SystemRoot, 'WindowsPowerShell', 'v1.0', 'powershell.exe')
              else
                process.env.SHELL
        shellArguments:
          title: 'Shell Arguments'
          description: 'Specify some arguments to use when launching the shell.'
          type: 'string'
          default: ''
        workingDirectory:
          title: 'Working Directory'
          description: 'Which directory should be the present working directory when a new terminal is made?'
          type: 'string'
          default: 'Project'
          enum: ['Home', 'Project', 'Active File']
    style:
      type: 'object'
      order: 3
      properties:
        theme:
          title: 'Theme'
          description: 'Select a theme for the terminal.'
          type: 'string'
          default: 'standard'
          enum: [
            'standard',
            'inverse',
            'grass',
            'homebrew',
            'man-page',
            'novel',
            'ocean',
            'pro',
            'red',
            'red-sands',
            'silver-aerogel',
            'solid-colors',
          ]
        fontFamily:
          title: 'Font Family'
          description: 'Override the editor\'s default font family.'
          type: 'string'
          default: 'monospace'
        fontSize:
          title: 'Font Size'
          description: 'Override the editor\'s default font size.'
          type: 'integer'
          default: do -> atom.config.get('editor.fontSize')
          minimum: 1
          maximum: 100
        maxPanelHeight:
          title: 'Maximum Panel Height'
          description: 'Maximum height of a terminal panel.'
          type: 'integer'
          default: 300
          minimum: 50
    colors:
      type: 'object'
      order: 4
      properties:
        red:
          title: 'Red'
          description: 'Red color used for status icon.'
          type: 'color'
          default: 'red'
        orange:
          title: 'Orange'
          description: 'Orange color used for status icon.'
          type: 'color'
          default: 'orange'
        yellow:
          title: 'Yellow'
          description: 'Yellow color used for status icon.'
          type: 'color'
          default: 'yellow'
        green:
          title: 'Green'
          description: 'Green color used for status icon.'
          type: 'color'
          default: 'green'
        blue:
          title: 'Blue'
          description: 'Blue color used for status icon.'
          type: 'color'
          default: 'blue'
        purple:
          title: 'Purple'
          description: 'Purple color used for status icon.'
          type: 'color'
          default: 'purple'
        pink:
          title: 'Pink'
          description: 'Pink color used for status icon.'
          type: 'color'
          default: 'hotpink'
        cyan:
          title: 'Cyan'
          description: 'Cyan color used for status icon.'
          type: 'color'
          default: 'cyan'
        magenta:
          title: 'Magenta'
          description: 'Magenta color used for status icon.'
          type: 'color'
          default: 'magenta'
