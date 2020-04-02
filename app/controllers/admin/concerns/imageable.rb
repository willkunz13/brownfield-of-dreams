# frozen_string_literal: true

module Imageable # rubocop:todo Style/Documentation
  extend ActiveSupport::Concern

  def remote_file_image?(url)
    if uri?(url)
      Faraday.get(url).env.response_headers[\
        'content-type'].include?('image') == true
    else
      false
    end
  end

  def uri?(string)
    uri = URI.parse(string)
    %w[http https].include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
