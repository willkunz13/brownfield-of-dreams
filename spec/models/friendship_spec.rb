# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to :predator }
    it { should belong_to :prey }
  end
end
