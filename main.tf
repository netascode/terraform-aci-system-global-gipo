resource "aci_rest" "fmcastSystemGIPoPol" {
  dn         = "uni/infra/systemgipopol"
  class_name = "fmcastSystemGIPoPol"
  content = {
    useConfiguredSystemGIPo = var.use_infra_gipo == true ? "enabled" : "disabled"
  }
}
