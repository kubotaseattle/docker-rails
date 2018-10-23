Types::QueryType = GraphQL::ObjectType.define do
name 'Query'

  field :users do
    type types[Types::UserType]
    resolve -> (obj, args, ctx)  {
      User.all
    }
  end
end
