# Module Big Query 

This optional module is used to create a Big Query environment.

```hcl
module "big-query" {
  source                                 = "./modules/big_query"
  project_id                             = "prj-datalake-prd"
  region                                 = "us-central1"
  bucket_names_1                         = ['bucket_1', 'bucket_2']
  storage                                = "REGIONAL"
}

```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The GCP project where Big Query is created. | `string` |  | yes |
| region | Region where the Big Query is created. | `string` |  | no |
| bucket_names_1 | List of bucket names that will be created. | `list(string)` |  | yes |

## Outputs

| Name | Description |
|------|-------------|


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
