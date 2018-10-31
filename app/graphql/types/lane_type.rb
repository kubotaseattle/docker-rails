module Types
  class LaneType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :tasks,[TaskType], null: true
  end
end
