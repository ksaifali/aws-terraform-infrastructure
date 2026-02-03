resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d31"
  instance_type = "t2.micro"
}
