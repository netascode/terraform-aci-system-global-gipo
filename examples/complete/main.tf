module "aci_system_global_gipo" {
  source  = "netascode/system-global-gipo/aci"
  version = ">= 0.0.1"

  use_infra_gipo = true
}
