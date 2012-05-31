require 'spec_helper'

describe BookmarksController do
  render_views

  describe "GET 'index'" do
    it "returns http success" do
      sign_in Factory(:user)
      get 'index'
      response.should be_success
    end

    it "should require authentication" do
      get :index
      response.should be_redirect
    end
  end

  describe "POST create" do

    it "should require authentication" do
      post :create
      response.should be_redirect
    end

    describe "authenticated request" do

      before do
        @user = Factory :user
        @bookmark_address = "http://www.fake.com"
        sign_in @user
      end

      def post_create_bookmark
        post :create, :bookmark => @attrs
      end

      describe "with valid bookmarks attributes" do

        before do
          @attrs = {:user_id => @user.id, :address => @bookmark_address}
        end
      
        it "should return HTTP success" do
          post_create_bookmark
          response.should be_success
        end

        it "should increase bookmarks count" do
          expect {
            post_create_bookmark
          }.to change(Bookmark, :count).by(1)
        end

        it "should add address to user bookmarks" do
          post_create_bookmark
          @user.bookmarks.map(&:address).include?(@bookmark_address).should be_true
        end

        it "should flash bookmark created message" do
          post_create_bookmark
          flash[:notice].should == I18n.t(:successful, :scope => [:flash, :bookmarks, :create])
        end

      end

      describe "with invalid bookmarks attributes" do

        it "should return HTTP success" do
          post_create_bookmark
          response.should be_success
        end

        it "should not increase bookmarks count" do
          expect {
            post_create_bookmark
          }.not_to change(Bookmark, :count)
        end

      end

    end

  end

end
