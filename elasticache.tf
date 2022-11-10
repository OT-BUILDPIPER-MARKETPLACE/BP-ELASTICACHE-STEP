module "elasticache" {
  source  = "OT-CLOUD-KIT/elasticache/aws"
  version = "0.0.1"
  name = var.name
  notification_topic_arn = var.notification_topic_arn
  security_group_ids = var.security_group_ids
  snapshot_arns = var.snapshot_arns
  snapshot_name = var.snapshot_name
  subnet_ids = var.subnet_ids
}

