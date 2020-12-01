# frozen_string_literal: true

# Replies controller
class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: %i[edit update show destroy]
  before_action :set_article, only: %i[create edit show update destroy]

  def create
    @reply = @article.replies.create(params[:reply].permit(:reply, :article_id))
    @reply.user_id = current_user.id

    respond_to do |format|
      format.html { redirect_to article_path(@article) } if @reply.save
      format.html { redirect_to article_path(@article), notice: 'Reply did not save. Please try again.' }
    end
  end

  def new; end

  def destroy
    @reply = @article.replies.find(params[:id])
    @reply.destroy
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @reply = @article.replies.find(params[:id])
  end

  def update
    @reply = @article.replies.find(params[:id])
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to article_path(@article), notice: 'Reply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end
end
