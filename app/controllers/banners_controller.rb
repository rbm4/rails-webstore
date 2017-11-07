class BannersController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  def new
      @banner = Banner.new
  end
  def create
    @banner = Banner.new(banner_params)
    if @banner.save
        flash[:success] = "Banner ativo!"
        redirect_to root_path
    else
        render :new
    end
  end
  private
    def banner_params
        params.require(:banner).permit(:place, :portrait, :password_confirmation, :password_news)
    end
end
