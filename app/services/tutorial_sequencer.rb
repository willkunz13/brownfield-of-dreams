# frozen_string_literal: true

class TutorialSequencer # rubocop:todo Style/Documentation
  def initialize(tutorial, sequenced_video_ids)
    @tutorial = tutorial
    @sequenced_video_ids = sequenced_video_ids
  end

  def run!
    update_position_if_changed!
  end

  private

  attr_reader :tutorial, :sequenced_video_ids

  def videos
    tutorial.videos.to_a
  end

  def update_position_if_changed!
    sequenced_video_ids.each.with_index(1) do |video_id, index|
      # rubocop:todo Lint/ShadowingOuterLocalVariable
      video = videos.find do |video|
        # rubocop:enable Lint/ShadowingOuterLocalVariable
        video.id == video_id.to_i
      end

      video.update(position: index) if video.position != index
    end
  end
end
