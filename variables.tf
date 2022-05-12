variable "UAT-Azure-Tags" {
  type        = map(any)
  description = "This sets the correct tags for Azure Resources in UAT"
  default = {
    Environment = "UAT"
    Cloud       = "Azure"
    Terraform   = "True"
  }
}

variable "UAT-Azure-Location" {
  type        = string
  description = "Sets the Location to Sweden Central"
  default     = "Sweden Central"
}

variable "UAT-Azure-Account_tier" {
  type        = string
  description = "Sets the account tier for Storage Accounts in UAT"
  default     = "Premium"
}

variable "UAT-Azure-account_replication_type" {
  type        = string
  description = "Sets the account replication type in UAT"
  default     = "LRS"
}

variable "UAT-Azure-Collation" {
  type        = string
  description = "Sets the Collation of Databases"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}