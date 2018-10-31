
class Types::QueryType < Types::BaseObject

  field :lanes, [Types::LaneType], null: true do
  end

  def lanes
    Lane.all
  end

  field :tasks, [Types::TaskType], null: true do
  end

  def tasks
    Task.all
  end

end
