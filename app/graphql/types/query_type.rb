  Types::QueryType = GraphQL::ObjectType.define do
name 'Query'

  field :lanes do
    type types[Types::LaneType]
    resolve -> (obj, args, ctx)  {
      Lane.all
    }
  end

  field :tasks do
    type types[Types::TaskType]
    resolve -> (obj, args, ctx)  {
      Task.all
    }
  end
end
