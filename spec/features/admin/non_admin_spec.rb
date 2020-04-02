# frozen_string_literal: true

require 'rails_helper'

describe 'Catch non admin user' do
  scenario 'admin dashboard' do
    user = create(:user)
    tutorial = create(:tutorial)
    create(:video, tutorial_id: tutorial.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect { visit '/admin/dashboard' }.to raise_error(ActionController::RoutingError)
  end
end
