variable "web_sg_ports" {
  type        = list(number)
  description = "Ingress ports"
  default     = [80,443]
}