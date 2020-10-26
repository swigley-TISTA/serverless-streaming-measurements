locals {

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
  app_name = local.environment_vars.locals.app_name
}


terraform {
  # Deploy version v0.0.3 in stage
  source = "../../modules/api_gateway"
}

include {
  path = find_in_parent_folders()
}


inputs = {
   apigw_name = "${local.app_name}-api"
   app_env = local.env
}