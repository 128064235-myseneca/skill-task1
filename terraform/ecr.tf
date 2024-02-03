resource "aws_ecr_repository" "my_app_repo" {
  name                 = "assignment1"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "my_db_repo" {
  name                 = "mysql"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}