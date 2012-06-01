class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def after_sign_in_path_for(user)
    bookmarks_path
  end

  def assign_flash(key)
    flash.now[:notice] = I18n.t(key, :scope => [:flash, params[:controller], params[:action]])
  end

end
