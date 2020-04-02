# rubocop:todo Style/Documentation
# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::VideosController < ApplicationController
  def show
    render json: Video.find(params[:id])
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/ClassAndModuleChildren
