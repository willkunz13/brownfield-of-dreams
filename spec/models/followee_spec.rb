require 'rails_helper'
  
RSpec.describe Followee, type: :model do
	before(:each) do
		@data = {login: 'a', html_url: 'x'} 
	end

  it 'init' do
    followee = Followee.new(@data)
    expect(followee.name).to eq('a')
    expect(followee.url).to eq('x')
  end
    
  it 'link' do
    followee = Followee.new(@data)
    user = create(:user)
		user.username = 'a'	
		user.save	
		expect(followee.link).to eq(user)
  end
end
