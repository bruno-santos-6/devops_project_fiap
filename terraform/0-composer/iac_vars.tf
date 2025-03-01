##################### definições de variáveis infrastructure as code #####################
variable "iac_tool" {
  type        = string
  description = "plataforma / ferramenta utilizada. exemplo: terraform"
}
variable "iac_repository" {
  type        = string
  description = "repositório onde os códigos serão arnazenados."
}

