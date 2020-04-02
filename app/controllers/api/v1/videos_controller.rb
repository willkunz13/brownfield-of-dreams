# rubocop:todo Style/Documentation
# frozen_string_literal: true

class Ap
  class V1
    class VideosController < ApplicationController
      def show
        render json: Video.find(params[:id])
      end
    end
  end
end
# rubocop:enable Style/Documentation
