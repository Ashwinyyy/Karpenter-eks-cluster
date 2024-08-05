terraform {
    backend "s3" {
        bucket = "eks-eks-eks"
        key    = "state/terraform.tfstate"
        region     = "us-east-2"
        #dynamodb_table = "dynamodb-state-locking"
    }
}

