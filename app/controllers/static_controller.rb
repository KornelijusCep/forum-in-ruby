# frozen_string_literal: true

# Static controller
class StaticController < ApplicationController
  def show
    render params[:page]
  end
end
