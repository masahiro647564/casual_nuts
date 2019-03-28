class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @q = Post.includes(:nut_name_or_genre_name).ransack(params[:q])
    @posts = @q.result.with_attached_image.find_newest_posts(params[:page])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nick_name, :avatar])
  end
end
