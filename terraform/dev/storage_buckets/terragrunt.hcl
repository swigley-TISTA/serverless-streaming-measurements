locals {

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
  app_name = local.environment_vars.locals.app_name
  bucket_prefix = local.app_name
  aws_region = local.region_vars.locals.aws_region
}


# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  # Deploy version v0.0.3 in stage
  source = "../../modules/storage_bucket"

}


inputs = {
  app_env = "${local.env}"
  aws_region = "${local.aws_region}"
  bucket_name = "${local.bucket_prefix}-${local.env}"
}