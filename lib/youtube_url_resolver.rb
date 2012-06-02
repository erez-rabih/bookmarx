class YoutubeURLResolver

  class << self

    def get_video_id_from_url(url)
      url[/.*youtube.*v=(\w+)&?/]
      $1
    end

    def get_jsonp_url_for_video_id(url)
      id = get_video_id_from_url(url)
      return nil  unless id
      "https://gdata.youtube.com/feeds/api/videos?q=#{id}&v=2&alt=json-in-script&callback=showVideoTitleAndThumbnail"
    end

  end
end
