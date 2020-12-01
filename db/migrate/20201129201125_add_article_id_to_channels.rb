# frozen_string_literal: true

class AddArticleIdToChannels < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :article_id, :integer
  end
end
