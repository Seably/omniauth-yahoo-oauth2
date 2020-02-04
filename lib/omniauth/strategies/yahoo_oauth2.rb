# frozen_string_literal: true

require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class YahooOauth2 < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "openid2"
      USER_INFO_URL = "https://api.login.yahoo.com/openid/v1/userinfo"

      option :name, "yahoo_oauth2"
      option :client_options,
             site:          "https://api.login.yahoo.com",
             authorize_url: "/oauth2/request_auth",
             token_url:     "/oauth2/get_token"

      uid { raw_info["sub"] }

      info do
        prune!(
          name:       raw_info["nickname"],
          nickname:   raw_info["nickname"],
          first_name: raw_info["given_name"],
          last_name:  raw_info["family_name"],
          email:      raw_info["email"],
          location:   raw_info["location"],
          image:      raw_info.dig("profile_images", "image192"),
          phone:      raw_info["phone_number"]
        )
      end

      def raw_info
        @raw_info ||= access_token.get(USER_INFO_URL).parsed
      end

      private

      def prune!(hash)
        hash.delete_if do |_, v|
          prune!(v) if v.is_a?(Hash)
          v.nil? || (v.respond_to?(:empty?) && v.empty?)
        end
      end
    end
  end
end
