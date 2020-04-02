# rubocop:todo Style/Documentation
# frozen_string_literal: true

class Api
  class V1
    class TutorialsController < ApplicationController
      def index
        render json: Tutorial.all
      end

      def show
        render json: Tutorial.find(params[:id])
      end
    end
  end
end
# rubocop:enable Style/Documentation
