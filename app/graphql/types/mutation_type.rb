module Types
  class MutationType < Types::BaseObject

    # create
    # create処理をするfieldを用意して、引数に何を与えるかの処理をブロックで記述
    field :create_task, TaskType, null: true, description: "Create a task" do
      argument :task, Types::TaskInputType, required: true
    end

    # ActiveRecordでデータベースに問い合わせる処理をメソッド形式で定義
    def create_task(task:)
      # to_hメソッドはオブジェクトをハッシュに変換する
      Task.create task.to_h
    end

    # update
    # updateは成功（true）、失敗（false）が分かればいいので、戻り値はBoolean型
    # null制約 null;falseを設定したfieldは、フロント側でクエリを取得した時やmutationを実行した際にエラーが返るようになる
    field :update_task, Boolean, null: false, description: "Update a task" do
      argument :task, Types::TaskInputType, required: true
    end

    def update_task(task:)
      existing = Task.where(id: task[:id]).first
      #&.でnil以外なら更新されたデータのhashを返す
      existing&.update task.to_h
    end

    # delete
    field :delete_task, Boolean, null: false, description: "Delete a task" do
      argument :id, ID, required: true
    end

    def delete_task(id:)
      Task.where(id: id).destroy_all
      true
    end

  end
end
