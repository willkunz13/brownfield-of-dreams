# rubocop:todo Style/Documentation
# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren
# rubocop:disable Metrics/AbcSize

class Admin::VideosController < Admin::BaseController
  def edit
    @video = Video.find(params[:video_id])
  end

  def update
    video = Video.find(params[:id])
    video.update(video_params)
  end

  def create # rubocop:todo Metrics/MethodLength
    begin
      tutorial  = Tutorial.find(params[:tutorial_id])
      thumbnail = YouTube::Video.by_id(new_video_params[:video_id]).thumbnail
      var       = new_video_params.merge(thumbnail: thumbnail)
      video     = tutorial.videos.new(var)
      video.save
      flash[:success] = 'Successfully created video.'
    rescue StandardError
      flash[:error] = 'Unable to create video.'
    end
    redirect_to edit_admin_tutorial_path(id: tutorial.id)
  end

  private

  def video_params
    params.permit(:position)
  end

  def new_video_params
    params.require(:video).permit(:title, :description, :video_id, :thumbnail)
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/ClassAndModuleChildren
# rubocop:enable Metrics/AbcSize
