require 'spec_helper'

describe YoutubeURLResolver do

  let :invalid_url do
    "http://www.dddd.com"
  end

  let :valid_url do
    "http://www.youtube.com/watch?v=qeJJOjb7fj4"
  end

  let :valid_url_id do
    "qeJJOjb7fj4"
  end

  let :valid_url_jsonp_addresss do
    "https://gdata.youtube.com/feeds/api/videos?q=#{valid_url_id}&v=2&alt=json-in-script&callback=showVideoTitleAndThumbnail"
  end


  describe "get_video_id_from_url" do

    describe "not a youtube url" do
      it "should return nil" do
        YoutubeURLResolver.get_video_id_from_url(invalid_url).should be_nil
      end
    end

    describe "youtube url" do
      
      it "should return id" do
        YoutubeURLResolver.get_video_id_from_url(valid_url).should == valid_url_id
      end

      it "should parse multiple query string values urls" do
        YoutubeURLResolver.get_video_id_from_url(valid_url).should == valid_url_id
      end
    end

  end

  describe "get_jsonp_url_for_video_id" do
    describe "not a youtube url" do

      it "should return nil" do
        YoutubeURLResolver.get_jsonp_url_for_video_id(invalid_url).should be_nil
      end

    end

    describe "youtube url" do
      it "should return expected jsonp js address" do
        YoutubeURLResolver.get_jsonp_url_for_video_id(valid_url).should == valid_url_jsonp_addresss
      end
    end
  end

end
