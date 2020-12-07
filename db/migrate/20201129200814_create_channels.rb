# frozen_string_literal: true

# Added channels for articles
class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :channel

      t.timestamps
    end
  end
end
