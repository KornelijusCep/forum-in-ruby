# frozen_string_literal: true

# Added channel id to article
class AddChannelIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :channel_id, :integer
  end
end
