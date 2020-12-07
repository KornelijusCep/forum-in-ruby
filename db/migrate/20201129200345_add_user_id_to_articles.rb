# frozen_string_literal: true

# Added users id to articles
class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :integer
  end
end
