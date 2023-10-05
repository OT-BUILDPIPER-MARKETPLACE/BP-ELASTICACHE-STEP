locals {
   subnet_ids = var.subnet_ids
   vpc_cidr_range = var.vpc_cidr_range
   vpc_id = var.vpc_id
}

module "elasticache" {
  source                        = "OT-CLOUD-KIT/elasticache/aws"
  version                       = "0.0.1"
  name                          = var.name
  number_cache_clusters         = var.number_cache_clusters
  num_node_groups               = var.num_node_groups
  automatic_failover_enabled    = var.automatic_failover_enabled
  multi_az_enabled              = var.multi_az_enabled
  cluster_mode_enabled          = var.cluster_mode_enabled
  replication_group_description = var.replication_group_description
  replicas_per_node_group       = var.replicas_per_node_group
  node_type                     = var.node_type
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  subnet_ids                    = local.subnet_ids
  security_group_ids            = [module.elasticache_security_group.sg_id]
  transit_encryption_enabled    = var.transit_encryption_enabled
  parameter =                   = var.parameter
}
module "elasticache_security_group" {
  source                              = "OT-CLOUD-KIT/security-groups/aws"
  version                             = "1.0.0"
  name_sg                             = var.sg_name
  tags                                = var.tags
  enable_whitelist_ip                 = var.enable_whitelist_ip
  enable_source_security_group_entry  = var.enable_source_security_group_entry
  create_outbound_rule_with_src_sg_id = var.create_outbound_rule_with_src_sg_id

  vpc_id = local.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "opening port 6379 for vpc  cidr"
          from_port    = 6379
          to_port      = 6379
          protocol     = "tcp"
          cidr         = [local.vpc_cidr_range]
          source_SG_ID = []
        },
    
      ]
    }
  }
}
