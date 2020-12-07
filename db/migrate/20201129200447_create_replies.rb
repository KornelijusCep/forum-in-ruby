# frozen_string_literal: true

# Created replies for articles
class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :reply

      t.timestamps
    end
  end
end
