
### terraform backend state bucket
 - S3 bucket to hold terraform state

#### configure
 - the folllowing keys should be exported with their correspondong values
 - TF_VAR_AWS_ACCESS_KEY
 - TF_VAR_AWS_SECRET_KEY
 - TF_VAR_AWS_REGION

#### use
```hcl
terraform {
  backend "s3" {
    bucket          = "terraform-backend-jaiye"
    key             = "terraform/<project-name>/<file-name>"
    region          = "us-east-1"
    dynamodb_table  = "terraform-state"
  }
}
```

#### apply
 - terraform plan -out=plan
 - terraform apply plan

#### todo
 - move `logs_bucket` config to separate repo

