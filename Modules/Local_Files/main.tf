resource "local_file" "file" {
  filename = "${var.file_name}.txt"
  content  = "Foo Bar"
}