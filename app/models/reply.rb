# frozen_string_literal: true

# Reply model
class Reply < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :reply, presence: true
end
