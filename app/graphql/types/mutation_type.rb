module Types
  class MutationType < Types::BaseObject

    # create処理をするfieldを用意して、引数に何を与えるかの処理をブロックで記述
    field :create_user, UserType, null: true, description: "Create a user" do
      argument :name, String, required: false, camelize: false
      argument :email, String, required: false, camelize: false
    end

    # ActiveRecordでデータベースに問い合わせる処理をメソッド形式で定義
    def create_user(name:, email:)
      User.create name: name, email: email
    end

  end
end
