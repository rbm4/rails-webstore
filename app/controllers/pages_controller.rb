class PagesController < ApplicationController
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
    render partial: "layouts/painelMenus"
  end
end
