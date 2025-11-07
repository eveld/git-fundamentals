resource "layout" "terminal_instructions" {
  column {
    width = 60

    tab "terminal" {
      target = resource.terminal.shell
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
