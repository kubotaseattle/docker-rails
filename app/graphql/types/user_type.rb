# module Types
#   class UserType < Types::BaseObject
#     # fieldはどのデータにアクセスするかを定義している
#     field :id, ID, null: false
#     field :name, String, null: false
#     field :email, String, null: false
#   end
# end


Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
end
