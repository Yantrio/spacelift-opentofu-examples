terraform {
}

variable "module_location" {
  description = "The location of the module to use"
  type        = string
}

module "early_evaluation" {
  source = var.module_location
}

output "root_space_name" {
  value = module.early_evaluation.output
}
