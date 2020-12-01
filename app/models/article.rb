# frozen_string_literal: false

# Article model
class Article < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
end
