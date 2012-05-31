require 'spec_helper'

describe User do
  
  describe "initialization" do
    it "should initialize" do
      expect {
        User.new
      }.not_to raise_exception
    end

    describe "validations" do

      ATTRIBUTES = { :email => "fake@email.com", :password => "fakepass" }

      before do
        @user = User.new(ATTRIBUTES)
      end

      it "should be valid created with ATTRIBUTES" do
        expect {
          @user.save!
        }.not_to raise_exception
      end

      ATTRIBUTES.each do |attr, value|
        it "should validate presence for #{attr}" do
          @user.send("#{attr}=", nil)
          @user.save
          @user.errors.keys.include?(attr).should be_true
        end
      end
    end
  end

  describe "bookmarks" do
    it "should have bookmarks" do
      expect { Factory(:user).bookmarks }.not_to raise_exception
    end

    it "should have an empty bookmarks list on initialization" do
    :q

      Factory(:user).bookmarks.should be_blank
    end
  end

end
