class SnowflakeDatabase(SnowflakeResource):
    def __init__(self, **kwargs):

        self.name = kwargs["name"]
        self.owner = kwargs["owner"]
        self.comment = kwargs["comment"]
        self.tf_filename = "snowflake.tf"
        super().__init__(**kwargs)

    @property
    def snowflake_provider_resource(self):

        return "snowflake_database"

    @property
    def resource_attributes(self):

        return {
            "name": stringify(self.name),
            "comment": stringify(self.comment),
        }
