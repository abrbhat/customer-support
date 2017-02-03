module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def error
      json["error"]
    end
  end
end
