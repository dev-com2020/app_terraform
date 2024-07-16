variable "aws_acces_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  type = string
  description = "Region AWS"
  default = "eu-central-1"
}

variable "instance_count" {
    type = number
    description = "Liczba instancji EC2"
    default = 3
}

variable "enable_logging" {
  type = bool
  description = "Czy włączyć logi"
  default = false
}

variable "instance_types" {
    type = list(string)
    description = "Lista typów instancji EC2"
    default = [ "t2.micro", "t2.nano" ]
}

variable "tags" {
    type = map(string)
    description = "Tagi dla zasobów"
    default = {
      Environment = "devs"
      Project = "TerraExample"
    }
}

variable "admin_user" {
    type = object({
        username = string
        email = string
    })
    description = "Info o adminie"
    default = {
        username = "admin"
        email = "admin@example.com"     
    }  
}

variable "config_values" {
    type = tuple([string,number,bool])
    description = "Konfiguracja"
    default = [ "config", 10, true ]
}

