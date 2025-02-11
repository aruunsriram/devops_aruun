
# Static Website Hosting on AWS S3 using Terraform

## Overview
This project automates the deployment of a **static website** on **AWS S3** using **Terraform**. It ensures the website is publicly accessible while maintaining security best practices.

## Features
- ✅ **Automated S3 Bucket Creation**
- ✅ **Bucket Ownership & Access Controls**
- ✅ **Public Access Configuration & Bucket Policy**
- ✅ **Static Website Hosting with `index.html` & `error.html`**
- ✅ **Fully Automated Deployment with Terraform**

## Prerequisites
- AWS account with IAM permissions for S3 & Terraform
- Terraform installed ([Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- AWS CLI configured with appropriate credentials ([AWS CLI Setup](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))

## Setup Instructions
### 1️⃣ Clone the Repository
```sh
git clone <repository-url>
cd <project-folder>
```

### 2️⃣ Initialize Terraform
```sh
terraform init
```

### 3️⃣ Apply the Terraform Configuration
```sh
terraform apply -auto-approve
```
This will create the S3 bucket, configure permissions, and upload the `index.html` and `error.html` files.

### 4️⃣ Access Your Website
After successful deployment, you can access your static website using:
```sh
http://<your-bucket-name>.s3-website-<region>.amazonaws.com
```

## Terraform Resources Explained
### **1️⃣ S3 Bucket Creation**
Creates an AWS S3 bucket for hosting the static website.
```hcl
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}
```

### **2️⃣ Enabling Public Access**
Configures the S3 bucket to allow public read access.
```hcl
resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.mybucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
```

### **3️⃣ Defining Bucket Policy**
Grants public read access to the S3 bucket objects.
```hcl
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.mybucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = "${aws_s3_bucket.mybucket.arn}/*"
    }]
  })
}
```

### **4️⃣ Uploading Website Files**
Uploads the `index.html` and `error.html` pages.
```hcl
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  source = "index.html"
  acl    = "public-read"
  content_type = "text/html"
}
```

### **5️⃣ Enabling Static Website Hosting**
Sets up the S3 bucket for website hosting.
```hcl
resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
```

## Troubleshooting
### ❌ Error: `BucketAlreadyExists`
- Ensure the bucket name is unique across AWS.
- Modify `var.bucketname` in `terraform.tfvars`.

### ❌ Error: `AccessDenied`
- Check if your IAM user has permissions for `s3:PutObject` and `s3:GetObject`.
- Run `aws s3api get-bucket-policy --bucket <your-bucket-name>` to verify the policy.

### ❌ Error: `The bucket does not allow ACLs`
- Some AWS regions enforce **BucketOwnerEnforced**, which disallows ACLs.
- Remove the `acl = "public-read"` line from `aws_s3_object`.

## Cleanup
To destroy all resources created:
```sh
terraform destroy -auto-approve
```

## Conclusion
This project showcases how to **deploy and host a static website** on AWS S3 using Terraform efficiently. 🚀 If you found this helpful, feel free to connect and discuss best practices! 💡

---

#AWS #Terraform #DevOps #S3 #InfrastructureAsCode #StaticWebsite #CloudAutomation

