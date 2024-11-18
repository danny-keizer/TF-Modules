resource "local_file" "example1" {
  filename = "${var.file_name}1.txt"
  content  = "First file"
}

resource "local_file" "example2" {
  filename = "${var.file_name}2.txt"
  content  = "Second file"
}

resource "local_file" "example3" {
  filename = "${var.file_name}3.txt"
  content  = "Third file"

  provisioner "local-exec" {
    command = "pwsh -File ${path.module}\\provisioner-tasks.ps1"
  }
}