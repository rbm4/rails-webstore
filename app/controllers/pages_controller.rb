class PagesController < ApplicationController
  def index
    @articles = Article.order(id: :desc)
  end
  def config_panel
    
  end
  def partial
    render partial: "layouts/painelMenus"
  end
end
