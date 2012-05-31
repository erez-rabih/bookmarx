class BookmarksController < ApplicationController
  before_filter :authenticate_user!
  def index
    load_bookmarks
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      flash.notice = I18n.t(:successful, :scope => [:flash, :bookmarks, :create])
    end
    load_bookmarks
    render :index
  end

  protected

  def load_bookmarks
    @bookmarks = current_user.bookmarks
    @has_bookmarks = @bookmarks.any?
    @new_bookmark = current_user.bookmarks.build
  end
end
