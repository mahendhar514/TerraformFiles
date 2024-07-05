resource "aws_s3_bucket" "cratingbucket1" {
    bucket = "mahendharemmadi514"
    provider = aws.mumbai
}

resource "aws_s3_bucket" "cratingbucket2" {
    bucket = "emmadimahendhar514"
    provider = aws.northvarginia
  
}