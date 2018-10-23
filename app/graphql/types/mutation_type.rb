module Types
  class MutationType < Types::BaseObject

    # create処理をするfieldを用意して、引数に何を与えるかの処理をブロックで記述
    field :create_user, UserType, null: true, description: "Create a user" do
      argument :user, Types::UserInputType, required: true
    end

    # ActiveRecordでデータベースに問い合わせる処理をメソッド形式で定義
    def create_user(user:)
      # to_hメソッドはオブジェクトをハッシュに変換する
      User.create user.to_h
    end

  end
end
