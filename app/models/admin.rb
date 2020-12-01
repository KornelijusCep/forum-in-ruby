# frozen_string_literal: true

# Admin model
class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
end
