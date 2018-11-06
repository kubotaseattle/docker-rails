class Types::LaneInputType < GraphQL::Schema::InputObject
  graphql_name "LaneInputType"
  description "All the attributes for creating a lane"

  argument :id, ID, required: false
  argument :name, String, required: false, camelize: false
end
