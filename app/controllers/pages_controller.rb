class PagesController < ApplicationController
  before_action :require_user, only: [:config_panel,partial,portrait_update]
  before_action :set_s3_direct_post, only: [:partial]
  def index
    @articles = Article.order(id: :desc)
    @banners = []
    (0..6).each do |i|
      @banners[i] = Banner.where("place = :place", {place: "i/#{i}"}).last
    end
  end
  def config_panel
  
  end
  def partial
    if params[:partial] == "editInfo"
      @user = current_user
    elsif params[:partial] == "newArticle"
      @article = Article.new
    end
    render partial: "layouts/painelMenus"
  end
  def portrait_update
    @url = params[:url]
    p @url
    render partial: "layouts/portrait_update"
  end
end
