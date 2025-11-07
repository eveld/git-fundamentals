resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "git_workstation" {
  image {
    name = "ubuntu:22.04"
  }

  network {
    id = resource.network.main.meta.id
  }
}

resource "exec" "setup_environment" {
  target = resource.container.git_workstation

  script = "scripts/setup/install_packages.sh"
}

resource "exec" "configure_git" {
  target = resource.container.git_workstation

  script = "scripts/setup/configure_git.sh"

  depends_on = ["resource.exec.setup_environment"]
}
