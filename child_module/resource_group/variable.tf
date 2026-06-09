variable "resource_group"{
    description = "resource_group_details"
    type = map(object({
      name = string
      location = string
    }))
}