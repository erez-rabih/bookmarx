require 'spec_helper'

describe Bookmark do
  describe "initialization" do
    it "should initialize" do
      expect { Bookmark.new }.not_to raise_exception
    end

    describe "validations" do
      BOOKMARK_ATTRIBUTES = { :user_id => 1, :address => "http://www.fake.com" }
      
      before do
        @bookmark = Bookmark.new(BOOKMARK_ATTRIBUTES)
      end

      it "should be valid created with ATTRIBUTES" do
        expect { @bookmark.save! }.not_to raise_exception
      end

      BOOKMARK_ATTRIBUTES.each do |attr, value|
        it "should validate presence of #{attr}" do
          @bookmark.send("#{attr}=", nil)
          @bookmark.save
          @bookmark.errors.keys.include?(attr).should be_true
        end
      end
    end
  end

  describe "associations" do
    it "should belong to user" do
      expect {Factory(:bookmark, :user => Factory(:user)).user}.not_to raise_exception
    end
  end
end
