# frozen_string_literal: true

namespace :import do # rubocop:todo Metrics/BlockLength
  desc :"All youtube data"
  task all: %i[users tutorials videos]

  desc :"Create Users"
  task :users, [:users] => :environment do
    User.create(email: 'admin@example.com',
                first_name: 'Admin',
                last_name: 'Adminington',
                password: ENV['ADMIN_PASSWORD'],
                role: 1)
  end

  desc :"Create Tutorials"
  task :tutorials, [:tutorials] => :environment do
    url = "/youtube/v3/playlistItems?key=#{ENV['YOUTUBE_API_KEY']}"
    url3 = '=snippet&maxResults=50&order=date'
    url2 = "playlistId=#{tutorial.playlist_id}&part#{url3}"
    response = Faraday.get("https://www.googleapis.com#{url}&#{url2}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:items].each do |tutorial|
      Tutorial.create(
        title: tutorial[:snippet][:title],
        description: tutorial[:snippet][:description],
        thumbnail: tutorial[:snippet][:thumbnails][:high][:url],
        playlist_id: tutorial[:id]
      )
    end
  end

  desc :"Create Videos"
  task :videos, [:videos] => :environment do
    tutorials = Tutorial.all
    tutorials.each do |tutorial|
      url = "/youtube/v3/playlistItems?key=#{ENV['YOUTUBE_API_KEY']}"
      url3 = '=snippet&maxResults=50&order=date'
      url2 = "playlistId=#{tutorial.playlist_id}&part#{url3}"
      response = Faraday.get("https://www.googleapis.com#{url}&#{url2}")
      data = JSON.parse(response.body, symbolize_names: true)
      data[:items].each.with_index(1) do |vid, index|
        tutorial.videos.create!(
          title: vid[:snippet][:title],
          description: vid[:snippet][:description],
          thumbnail: vid[:snippet][:thumbnails][:high][:url],
          video_id: vid[:snippet][:resourceId][:videoId],
          position: index
        )
      end
    end
  end
end
