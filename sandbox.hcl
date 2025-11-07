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

  volume {
    source = "scripts/setup"
    destination = "/tmp/setup"
  }
}

resource "exec" "setup_environment" {
  target = resource.container.git_workstation

  script = "/tmp/setup/install_packages.sh"
}

resource "exec" "configure_git" {
  target = resource.container.git_workstation

  script = "/tmp/setup/configure_git.sh"

  depends_on = ["resource.exec.setup_environment"]
}
