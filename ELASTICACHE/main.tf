locals {
   subnet_ids = var.subnet_ids
   vpc_cidr_range = var.vpc_cidr_range
   vpc_id = var.vpc_id
}


module "elasticache" {
  source                        = "OT-CLOUD-KIT/elasticache/aws"
  version                       = "0.0.1"
  name                          = var.name
  notification_topic_arn        = var.notification_topic_arn
  security_group_ids            = [module.elasticache_security_group.sg_id]
  snapshot_arns                 = var.snapshot_arns
  snapshot_name                 = var.snapshot_name
  subnet_ids                    = local.subnet_ids
  apply_immediately             = var.apply_immediately
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  auth_token                    = var.auth_token
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  automatic_failover_enabled    = var.automatic_failover_enabled
  cluster_mode_enabled          = var.cluster_mode_enabled
  final_snapshot_identifier     = var.final_snapshot_identifier
  kms_key_id                    = var.kms_key_id
  maintenance_window            = var.maintenance_window
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  num_node_groups               = var.num_node_groups
  number_cache_clusters         = var.number_cache_clusters
  parameter                     = var.parameter
  parameter_group_enabled       = var.parameter_group_enabled
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  redis_engine_version          = var.redis_engine_version
  redis_family                  = var.redis_family
  replicas_per_node_group       = var.replicas_per_node_group
  replication_group_description = var.replication_group_description
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  subnet_group_name             = var.subnet_group_name
  tags                          = var.tags
  transit_encryption_enabled    = var.transit_encryption_enabled
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
