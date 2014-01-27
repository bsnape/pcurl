module PcURL

  class Request

    def request(url)
      response = get url
      parsed_response = parse_response response
      puts prettify(parsed_response)
    end

    def get(url)
      Curl.get(url).body_str
    end

    def parse_response(response)
      JSON.parse response
    end

    def prettify(response)
      JSON.pretty_generate response
    end

  end

end
