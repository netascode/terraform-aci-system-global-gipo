terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  use_infra_gipo = true
}

data "aci_rest" "fmcastSystemGIPoPol" {
  dn = "uni/infra/systemgipopol"

  depends_on = [module.main]
}

resource "test_assertions" "fmcastSystemGIPoPol" {
  component = "fmcastSystemGIPoPol"

  equal "useConfiguredSystemGIPo" {
    description = "useConfiguredSystemGIPo"
    got         = data.aci_rest.fmcastSystemGIPoPol.content.useConfiguredSystemGIPo
    want        = "enabled"
  }
}
