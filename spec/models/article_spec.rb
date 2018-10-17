require 'rails_helper'

# デフォルト
# RSpec.describe Article, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# Ruby on Rails 5の上手な使い方 p192,193
RSpec.describe Article, type: :model do
  it '記事タイトルがそのまま返ること' do
    article = Article.new(title: 'タイトルです')
    expect(article.abbreviated_title).to eq 'タイトルです'
  end
end
