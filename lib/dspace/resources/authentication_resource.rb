module Dspace
  module Resources
    class AuthenticationResource < ResourceKit::Resource

      resources do
        default_handler(400) { raise InvalidTokenError, 'Invalid access token.' }
        default_handler(403) { raise InvalidCredentialsError, 'Wrong Dspace credentials.' }

        action :login, 'POST /rest/login' do
          body { |email, password| JSON.generate({email: email, password: password}) }
          handler(200, 201) { |response| access_token = response.body }
        end

        action :logout, 'POST /rest/logout' do
          body { |object| JSON.generate(object.to_h) }
          handler(200, 201, 203, 204) { |response| true }
        end
      end

    end
  end
end
