locals {

  bucket_prefix = "${local.app_name}-app"
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
  app_name = local.environment_vars.locals.app_name
}


# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  # Deploy version v0.0.3 in stage
  source = "../../../modules/lambda"
}

inputs = {
  app_env = "dev"
  lambda_name = "data-generator-file-manager"
  aws_region = "us-east-2"
}