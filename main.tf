terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}

resource "spacelift_space" "opentofu_examples" {
  name            = "OpenTofu Examples"
  parent_space_id = "root"

  inherit_entities = false

  description = "This space contains examples of how to use OpenTofu with Spacelift."
  labels      = ["opentofu-example"]
}

resource "spacelift_blueprint" "this" {
  name        = "[OpenTofu] Early Evaluation Example"
  description = "This creates a stack that will use opentofu's early evaluation feature and will include variables from a var-file."
  labels      = ["opentofu-example"]
  space       = "root"
  state       = "PUBLISHED"
  template = yamlencode({
    "inputs" : [],
    "options" : {
      "trigger_run" : true
    }
    "stack" : {
      "name" : "[OpenTofu] Early Evaluation Example",
      "space" : spacelift_space.opentofu_examples.id,
      "administrative" : false,
      "vcs" : {
        "namespace" : var.github_org,
        "branch" : "main",
        "repository" : "spacelift-opentofu-examples"
        "provider" : "GITHUB",
        "project_root" : "examples/early-evaluation",
      },
      "vendor" : {
        "terraform" : {
          "manage_state" : true,
          "version" : "1.9.0",
          "workflow_tool" : "OPEN_TOFU",
          "use_smart_sanitization" : true,
        }
      },
      "environment" : {
        "variables" : [
          {
            "name" : "ro_TF_CLI_ARGS",
            "value" : "-var-file=variables.tfvars",
          },
          {
            "name" : "rw_TF_CLI_ARGS",
            "value" : "-var-file=variables.tfvars",
          }
        ]
      }
    }
  })
}
