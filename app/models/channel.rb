# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :articles
  has_many :users, through: :articles
end
