# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Follower, type: :model do
  before(:each) do
    @data = { login: 'a', html_url: 'x' }
  end

  it 'init' do
    follower = Follower.new(@data)
    expect(follower.name).to eq('a')
    expect(follower.url).to eq('x')
  end

  it 'link' do
    follower = Follower.new(@data)
    user = create(:user)
    user.username = 'a'
    user.save
    expect(follower.link).to eq(user)
  end
end
