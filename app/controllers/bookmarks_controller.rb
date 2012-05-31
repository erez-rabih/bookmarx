class BookmarksController < ApplicationController

  before_filter :authenticate_user!

  def index
    load_bookmarks
  end

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    flash_message = @bookmark.save ? :successful : :failed
    assign_flash flash_message
    load_bookmarks
    render :index
  end

  def destroy
    bookmark = current_user.bookmarks.find_by_id(params[:id])
    if bookmark
      bookmark.destroy
      assign_flash :successful
    else
      assign_flash :failed
    end
    load_bookmarks
    render :index
  end

  protected

  def load_bookmarks
    @bookmarks = current_user.reload.bookmarks
    @new_bookmark = Bookmark.new
  end
end
