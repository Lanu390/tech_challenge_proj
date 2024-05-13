# tech_challenge_proj

A repository to create EKS Cluster and Node Groups on AWS using Terraform.

(1) Install AWS CLI

As the first step, you need to install AWS CLI as we will use the AWS CLI (aws configure) command to connect Terraform with AWS in the next steps.

Follow the below link to Install AWS CLI.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

(2) Install Terraform

 Follow the below link to Install Terraform .
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

(3) Connect Terraform with AWS

(a).	Create IAM Users:
    o	Go to the IAM (Identity and Access Management) service in the AWS Management Console.
    o	Click on "Users" in the left-hand navigation pane and then click on "Add user."
    o	Enter a username for the new IAM user and select the access type (Programmatic access, AWS Management Console access, or both).
    o	Choose the permissions for the IAM user by adding them to one or more IAM groups or attaching policies directly.
    o	Optionally, set permissions boundary, tags, and enable MFA for the IAM user.
(b).	Access Keys (for Programmatic Access):
   o	If you selected "Programmatic access" during user creation, you would receive access keys (Access Key ID and Secret Access Key).
   o	Store these access keys securely, as they will be used to authenticate API requests made to AWS services.


(4) To connect Terraform with AWS. Run aws configure command and provide the AWS Security credentials.

(5) Remote Backend Set up:

    A remote backend stores the Terraform state file outside of your local file system and version control. Using S3 as a remote backend is a popular choice due to its reliability and scalability. Here's how to set it up:
•	Create an S3 Bucket: Create an S3 bucket in your AWS account to store the Terraform state. Ensure that the appropriate IAM permissions are set up.

(6) Initialize Terraform
      Clone the repository and Run terraform init. This will intialize the terraform environment for you and download the modules, providers 
    and other configuration required.

Optionally review the terraform configuration

(7) Run terraform plan to see the configuration it creates when executed.
    Finally, Apply terraform configuration to create EKS cluster with VPC

     terraform apply


