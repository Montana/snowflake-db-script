resource "snowflake_database" "analytics" {
  name = "ANALYTICS"
}

resource "snowflake_database" "raw" {
  name = "RAW"
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "demo database"
}
