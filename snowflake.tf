locals {
  analytics_schema_list = toset([
   "schema1",
   "schema2",
   "schema3",
  ])
}
resource "snowflake_schema" "analytics_schemas" {
  for_each      = local.analytics_schema_list
  name          = upper(each.value)
  database      = snowflake_database.analytics.name # db is defined in a different file
}
resource "snowflake_schema_grant" "analytics_schema_usage" {
  for_each      = local.analytics_schema_list
  database_name = snowflake_database.analytics.name 
  schema_name   = upper(each.value)
  privilege     = "USAGE"
  roles         = ["some_role"]
  depends_on    = [
    snowflake_schema.analytics_schemas # schemas must exist prior to creating grants
  ]
}
