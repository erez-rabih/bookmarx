class Bookmark < ActiveRecord::Base
  attr_accessible :address, :user_id

  belongs_to :user
  validates :address, :user_id, :presence => true

  def video_id
    YoutubeURLResolver.get_video_id_from_url(self.address)
  end

  def jsonp_url
    YoutubeURLResolver.get_jsonp_url_for_video_id(self.address)
  end

end
