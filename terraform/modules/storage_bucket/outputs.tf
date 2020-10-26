output "bucket_arn" {
  value = aws_s3_bucket.b.arn
  description = "The AWS ARN of the storage bucket."
}