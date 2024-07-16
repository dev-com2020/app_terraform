# variable "aws_acces_key" {}

# variable "aws_secret_key" {}

variable "aws_region" {
  type = string
  description = "Region AWS"
  default = "eu-central-1"
  validation {
    condition = contains(["eu-central-1", "us-west-1"], var.aws_region)
    error_message = "wybrany region musi znajdować się na liście"
  }
}

variable "instance_count" {
    type = number
    description = "Liczba instancji EC2"
    default = 3
    validation {
      condition = var.instance_count > 0
      error_message = "Ilość instancji musi być większa od zera"
    }
}

variable "enable_logging" {
  type = bool
  description = "Czy włączyć logi"
  default = true
}

variable "instance_type" {
    type = list(string)
    description = "Lista typów instancji EC2"
    default = ["t2.micro", "t2.micro"]
}

variable "tags" {
    type = map(string)
    description = "Tagi dla zasobów"
    default = {
      Environment = "devs"
      Project = "TerraExample"
    }
    validation {
      condition = contains(keys(var.tags), "Project")
      error_message = "Tag musi zawierać klucz Project"
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
    validation {
      condition = can(regex("^.+@.+$", var.admin_user.email))
      error_message = "Email musi być prawidłowy"
    }
}

variable "config_values" {
    type = tuple([string,number,bool])
    description = "Konfiguracja"
    default = [ "config", 10, true ]
}

variable "ami_id" {
    description = "ID obrazu AMI"
    type = string
    default = ""
}



