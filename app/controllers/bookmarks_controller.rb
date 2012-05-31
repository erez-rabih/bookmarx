class BookmarksController < ApplicationController
  before_filter :authenticate_user!
  def index
    load_bookmarks
  end

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    flash_message = @bookmark.save ? :successful : :failed
    flash.notice = I18n.t(flash_message, :scope => [:flash, :bookmarks, :create])
    load_bookmarks
    render :index
  end

  protected

  def load_bookmarks
    @bookmarks = current_user.bookmarks
    @new_bookmark = Bookmark.new
  end
end
