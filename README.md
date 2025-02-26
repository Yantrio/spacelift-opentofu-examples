# OpenTofu Examples

This project is intended to store examples of how to use OpenTofu with Spacelift. Each example is designed to create a blueprint, which can then be used to create a stack. This helps us keep our environments clean and organized.

## Structure

- `main.tf`: Defines the main configuration for the Spacelift provider and resources.
- `variables.tf`: Contains variable definitions used in the project.

## Usage

1. Fork the repository into your own VCS account.
2. Change or override the variable file to use your organization/user in github.
3. Create a stack in Spacelift pointing to this repository.
4. Spacelift will generate a bunch of blueprints that you can use to create example stacks from.

## Examples

### Early Evaluation

The `examples/early-evaluation` directory contains an example of how to use OpenTofu's early evaluation feature. It includes:

- `main.tf`: Defines the module and output.
- `variables.tfvars`: Contains variable values for the module.

The blueprint will create a stack and set the `ro_TF_CLI_ARGS` and `rw_TF_CLI_ARGS` so that we can test how well it passes the varfile via the `TF_CLI_ARGS`.
