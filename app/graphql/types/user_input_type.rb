class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "All the attributes for creating a user"

  argument :id, ID, required: false
  argument :name, String, required: false, camelize: false
  argument :email, String, required: false, camelize: false
end
