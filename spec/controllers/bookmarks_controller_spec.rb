require 'spec_helper'

describe BookmarksController do
  render_views
  
  def set_and_sign_user
    @user = Factory :user
    sign_in @user
  end

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
        set_and_sign_user
        @bookmark_address = "http://www.fake.com"
      end

      def post_create_bookmark(attrs)
        post :create, :bookmark => attrs
      end

      describe "with valid bookmarks attributes" do

        before do
          @attrs = {:address => @bookmark_address}
        end
      
        it "should return HTTP success" do
          post_create_bookmark(@attrs)
          response.should be_success
        end

        it "should increase bookmarks count" do
          expect {
            post_create_bookmark(@attrs)
          }.to change(Bookmark, :count).by(1)
        end

        it "should add address to user bookmarks" do
          post_create_bookmark(@attrs)
          @user.bookmarks.map(&:address).include?(@bookmark_address).should be_true
        end

        it "should flash bookmark created message" do
          post_create_bookmark(@attrs)
          flash[:notice].should == I18n.t(:successful, :scope => [:flash, :bookmarks, :create])
        end

      end

      describe "with invalid bookmarks attributes" do

        before do
          @attrs = {}
        end

        it "should return HTTP success" do
          post_create_bookmark(@attrs)
          response.should be_success
        end

        it "should not increase bookmarks count" do
          expect {
            post_create_bookmark(@attrs)
          }.not_to change(Bookmark, :count)
        end

      end

    end

  end

  describe "DELETE destroy" do

    describe "not authenticated" do
      it "should redirect" do
        delete :destroy
        response.should be_redirect
      end
    end

    describe "authenticated" do
      before do
        set_and_sign_user
        @bookmarks = [Factory(:bookmark, :user => @user), Factory(:bookmark, :user => @user)]
      end

      def send_delete_bookmark
        delete :destroy, :id => @bookmark_to_delete.id
      end
      
      
      describe "valid bookmark deletion" do

        before do
          @bookmark_to_delete = @bookmarks.first
        end

        it "should return HTTP success" do
          send_delete_bookmark
          response.should be_success
        end

        it "should decrease bookmarks count by 1" do
          expect {
            send_delete_bookmark
          }.to change(Bookmark, :count).by(-1)
        end
        
        it "should delete the right bookmark" do
          send_delete_bookmark
          @user.bookmarks.should == (@bookmarks - [@bookmarks.first])
        end

        it "should set flash message to successful delete" do
          send_delete_bookmark
          flash.notice.should == I18n.t(:successful, :scope => [:flash, :bookmarks, :destroy])
        end
        

      end
      
      describe "invalid bookmark deletion" do
        before do
          another_user = Factory :user
          @bookmark_to_delete = Factory(:bookmark, :user => another_user)
        end

        it "should return HTTP success" do
          send_delete_bookmark
          response.should be_success
        end

        it "should not decrease bookmarks count by 1" do
          expect {
            send_delete_bookmark
          }.not_to change(Bookmark, :count)
        end

        
        it "should set flash message to successful delete" do
          send_delete_bookmark
          flash.notice.should == I18n.t(:failed, :scope => [:flash, :bookmarks, :destroy])
        end
        
      end

    end
  end
 

end
