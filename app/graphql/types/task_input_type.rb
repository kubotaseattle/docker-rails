class Types::TaskInputType < GraphQL::Schema::InputObject
  graphql_name "TaskInputType"
  description "All the attributes for creating a task"

  argument :id, ID, required: false
  argument :name, String, required: false, camelize: false
  argument :lane_id, Integer, required: false
end
