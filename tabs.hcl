resource "terminal" "shell" {
  target = resource.container.git_workstation
  shell = "/bin/bash"
  working_directory = "/root/workspace"
  user = "root"
  theme = "dracula"

  # Custom prompt showing current Git branch
  prompt = "\\[\\033[01;32m\\]\\u@git-lab\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ "
}

resource "editor" "code" {
  workspace "git_workspace" {
    target = resource.container.git_workstation
    directory = "/root/workspace"
  }
}
