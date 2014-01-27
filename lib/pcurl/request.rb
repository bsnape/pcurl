module PcURL

  class Request

    def request(url)
      response = get url
      parsed_response = parse_response response
      pretty_response = prettify(parsed_response)
      puts pretty_response
      pretty_response
    end

    def get(url)
      Curl.get(url).body_str
    end

    def parse_response(response)
      begin
        JSON.parse response
      rescue
        raise "JSON parsing exception for response: #{response}"
      end
    end

    def prettify(response)
      JSON.pretty_generate response
    end

  end

end
