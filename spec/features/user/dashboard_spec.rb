# frozen_string_literal: true

require 'rails_helper'

describe 'A registered user', :vcr do # rubocop:todo Metrics/BlockLength
  it 'followers' do
    tutorial = create(:tutorial, title: 'How to Tie Your Shoes')
    create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial)
    user = create(:user)
    user.token = ENV['GITHUB_TEST_KEY']
    user.username = 'willkunz13'
    user.save

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    visit dashboard_path
    within('.github') do
      expect(page).to have_content('GITHUB')
      expect(page).to have_content('Followers')
      expect(page).to have_content('matthewwarsaw95')
    end
  end

  it 'following' do
    tutorial = create(:tutorial, title: 'How to Tie Your Shoes')
    create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial)
    user = create(:user)
    user.token = ENV['GITHUB_TEST_KEY']
    user.username = 'willkunz13'
    user.save

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    visit dashboard_path
    within('.github') do
      expect(page).to have_content('Following')
      expect(page).to have_content('iEv0lv3')
      expect(page).to have_content('itemniner')
    end
  end

  it 'friending' do
    create_list(:user, 3)

    user = User.first
    user.token = ENV['GITHUB_TEST_KEY']
    user.username = 'willkunz13'
    user.save

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    last = User.last
    last.token = ENV['GITHUB_EXTRA_KEY']
    last.username = 'itemniner'
    last.save

    visit dashboard_path
    within('#Followers') do
      click_on 'Add Friend'
    end
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Friendship Created')
    within('#Followers') do
      click_on 'Add Friend'
    end
    expect(page).to have_content('Already a Friend')
    within('#Friends') do
      expect(page).to have_content('itemniner')
    end
  end

  it 'bookmarking' do
    tutorial = create(:tutorial, title: 'How to Tie Your Shoes')
    video = create(:video,
                   title: 'The Bunny Ears Technique',
                   tutorial: tutorial)
    user = create(:user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    UserVideo.create(user_id: user.id, video_id: video.id)
    visit dashboard_path
    expect(page).to have_content(video.title)
  end
end
