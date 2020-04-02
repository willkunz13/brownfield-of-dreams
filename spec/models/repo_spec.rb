# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repo, type: :model do
  before(:each) do
    @data = { name: 'a', html_url: 'x' }
  end

  it 'init' do
    repo = Repo.new(@data)
    expect(repo.name).to eq('a')
    expect(repo.url).to eq('x')
  end
end
