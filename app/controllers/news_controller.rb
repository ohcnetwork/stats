class NewsController < ApplicationController
  def show
    @news = News.find_by(slug: params[:slug])
    redirect_to root_path if @news.blank?
  end
end
