resource "layout" "terminal_instructions" {
  column {
    width = 60

    tab "terminal" {
      title = "Terminal"
      target = resource.terminal.shell
    }

    tab "editor" {
      title = "Editor"
      target = resource.editor.code
    }
  }

  column {
    width = 40

    instructions {}
  }
}

resource "layout" "instructions_only" {
  column {
    instructions {}
  }
}
