class Article < ApplicationRecord
  #Ruby on Rails 5の上手な使い方 p192
  enum status: {draft: 0,published: 1}

  def abbreviated_title
    title.size >= 20 ? "#{title.slice(0, 19)}" :title
  end

  def published
    return if self.published?
    update({status: Article.statuses['published'], published_at: Time.current})
  end
end
