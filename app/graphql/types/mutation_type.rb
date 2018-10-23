module Types
  class MutationType < Types::BaseObject

    # create
    # create処理をするfieldを用意して、引数に何を与えるかの処理をブロックで記述
    field :create_user, UserType, null: true, description: "Create a user" do
      argument :user, Types::UserInputType, required: true
    end

    # ActiveRecordでデータベースに問い合わせる処理をメソッド形式で定義
    def create_user(user:)
      # to_hメソッドはオブジェクトをハッシュに変換する
      User.create user.to_h
    end

    # update
    # updateは成功（true）、失敗（false）が分かればいいので、戻り値はBoolean型
    # null制約 null;falseを設定したfieldは、フロント側でクエリを取得した時やmutationを実行した際にエラーが返るようになる
    field :update_user, Boolean, null: false, description: "Update a user" do
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.where(id: user[:id]).first
      #&.でnil以外なら更新されたデータのhashを返す
      existing&.update user.to_h
    end

    # delete
    field :delete_user, Boolean, null: false, description: "Delete a user" do
      argument :id, ID, required: true
    end

    def delete_user(id:)
      User.where(id: id).destroy_all
      true
    end

  end
end
