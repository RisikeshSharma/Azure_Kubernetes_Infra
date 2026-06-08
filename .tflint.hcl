config {
  module = true
  force  = false
}

plugin "azurerm" {
  enabled = true
  version = "0.23.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
