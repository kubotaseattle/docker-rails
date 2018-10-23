class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  # createする際に必要な引数を定義
  argument :name, String, required: false, camelize: false
  argument :email, String, required: false, camelize: false

  # resolveメソッドを定義し、引数に必要なfieldを渡し、ActiveRecordでDBに問い合わせる処理を記述する
  def resolve(first_name:, last_name:, yob:, is_alive:)
    User.create name: name, eimal: email
  end
end
