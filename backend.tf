terraform {
  backend "s3" {
    bucket = "rajesh0209"
    key    = "state-file-rajesh"
    region = "us-east-1"
    profile = "rajeshkumar"
    dynamodb_table = "rajeshdb0209"
  }
}
