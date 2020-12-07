# frozen_string_literal: true

# Added article id to reply
class AddArticleIdToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :article_id, :integer
  end
end
