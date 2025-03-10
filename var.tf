variable "networks" {
  type = map(object({
    cidr_block = string
    subnets    = map(object({ cidr_block = string }))
  }))
  default = {
    "private" = {
      cidr_block = "10.1.0.0/16"
      subnets = {
        "db1" = {
          cidr_block = "10.1.0.1/16"
        }
        "db2" = {
          cidr_block = "10.1.0.2/16"
        }
      }
    },
    "public" = {
      cidr_block = "10.1.1.0/16"
      subnets = {
        "webserver" = {
          cidr_block = "10.1.1.1/16"
        }
        "email_server" = {
          cidr_block = "10.1.1.2/16"
        }
      }
    }
    "dmz" = {
      cidr_block = "10.1.2.0/16"
      subnets = {
        "firewall" = {
          cidr_block = "10.1.2.1/16"
        }
      }
    }
  }
}
