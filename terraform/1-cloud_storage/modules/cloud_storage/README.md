# Module Cloud Storage 

This optional module is used to create a Cloud Storage environment.

```hcl
module "cloud-storage" {
  source                                 = "./modules/cloud_storage"
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
| project_id | The GCP project where Cloud Storage is created. | `string` |  | yes |
| region | Region where the Cloud Storage is created. | `string` |  | no |
| bucket_names_1 | List of bucket names that will be created. | `list(string)` |  | yes |
| storage | Bucket storage class | `string` |  | yes |

## Outputs

| Name | Description |
|------|-------------|


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
