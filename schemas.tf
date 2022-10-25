resource "snowflake_schema" "analytics_schema1" {
  name          = "SCHEMA1"
  database      = snowflake_database.analytics.name # db defined elsewhere
  depends_on    = [snowflake_database.analytics]
}
resource "snowflake_schema" "analytics_schema2" {
  name          = "SCHEMA2"
  database      = snowflake_database.analytics.name
  depends_on    = [snowflake_database.analytics]
}
resource "snowflake_schema" "analytics_schema3" {
  name          = "SCHEMA3"
  database      = snowflake_database.analytics.name
  depends_on    = [snowflake_database.analytics]
}
resource "snowflake_schema_grant" "analytics_schema1_usage" {
  database_name = snowflake_database.analytics.name 
  schema_name   = "SCHEMA1"
  privilege     = "USAGE"
  roles         = ["some_role"]
  depends_on    = [snowflake_schema.analytics_schema1]
}
resource "snowflake_schema_grant" "analytics_schema2_usage" {
  database_name = snowflake_database.analytics.name 
  schema_name   = "SCHEMA2"
  privilege     = "USAGE"
  roles         = ["some_role"]
  depends_on    = [snowflake_schema.analytics_schema2]
}
resource "snowflake_schema_grant" "analytics_schema3_usage" {
  database_name = snowflake_database.analytics.name 
  schema_name   = "SCHEMA3"
  privilege     = "USAGE"
  roles         = ["some_role"]
  depends_on    = [snowflake_schema.analytics_schema3]
}
