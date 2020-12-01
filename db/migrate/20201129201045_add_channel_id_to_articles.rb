# frozen_string_literal: true

class AddChannelIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :channel_id, :integer
  end
end
