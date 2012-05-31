class BookmarksController < ApplicationController
  before_filter :authenticate_user!
  def index
    @bookmarks = current_user.bookmarks
  end
end
