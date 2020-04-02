# rubocop:todo Style/Documentation
# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::TutorialsController < ApplicationController
  def index
    render json: Tutorial.all
  end

  def show
    render json: Tutorial.find(params[:id])
  end
end

# rubocop:enable Style/Documentation
# rubocop:enable Style/ClassAndModuleChildren
