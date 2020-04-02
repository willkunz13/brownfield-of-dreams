# frozen_string_literal: true

module YouTube
  class Video # rubocop:todo Style/Documentation
    attr_reader :thumbnail

    def initialize(data = {})
      @thumbnail = data[:items].first[:snippet][:thumbnails][:high][:url]
    end

    def self.by_id(id)
      new(YoutubeService.new.video_info(id))
    end
  end
end
