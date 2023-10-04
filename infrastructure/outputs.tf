output "endpoint" {
  description = "The IP address of the cluster master."
  value       = module.gke.endpoint
  sensitive   = true
}
