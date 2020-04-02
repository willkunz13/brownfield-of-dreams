require 'rails_helper'

RSpec.describe YouTube::Video, type: :model do
	it 'by_id' do
		YoutubeService.any_instance.stub(video_info: 1)
		YouTube::Video.any_instance.stub(initialize: 1)
		expect(YouTube::Video.by_id(1).thumbnail).to eq(nil)
	end
end
