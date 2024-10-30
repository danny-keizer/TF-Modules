output "file1_path" {
  description = "The path of the first file"
  value       = local_file.example1.filename
}

output "file2_path" {
  description = "The path of the second file"
  value       = local_file.example2.filename
}

output "file3_path" {
  description = "The path of the third file"
  value       = local_file.example3.filename
}