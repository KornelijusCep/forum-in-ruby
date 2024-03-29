# frozen_string_literal: true

# Article controller
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :find_channels, only: %i[index show new edit]
  before_action :authenticate_user!, except: %i[index show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.all.order('created_at desc')
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles = Article.all.all.order('created_at desc')
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Straipsnis sekmingai sukurtas.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Straipsnis sekmingai atnaujintas.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Straipsnis sekmingai pasalintas.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Find all channels in desc order
  def find_channels
    @channels = Channel.all.order('created_at desc')
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :content, :channel_id)
  end
end
