Types::QueryType = GraphQL::ObjectType.define do
name 'Query'

  field :tasks do
    type types[Types::TaskType]
    resolve -> (obj, args, ctx)  {
      Task.all
    }
  end
end
