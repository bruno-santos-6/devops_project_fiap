variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "name" {
  description = "Name of the alert policy"
  type        = string
}

variable "combiner" {
  description = "How to combine the results of multiple conditions to determine if an incident should be opened. Possible values: [\"AND\", \"OR\", \"AND_WITH_MATCHING_RESOURCE\"]"
  type        = string
}

variable "query" {
  description = "Monitoring Query Language query that outputs a boolean stream"
  type        = string
}

variable "duration" {
  description = "The amount of time that a time series must violate the threshold to be considered failing"
  type        = string
}

variable "trigger_count" {
  description = "The absolute number of time series that must fail the predicate for the condition to be triggered"
  type        = string
}