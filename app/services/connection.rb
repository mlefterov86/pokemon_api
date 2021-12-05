  class Connection
    attr_reader :query_params

    def self.endpoint
      'https://pokeapi.co/'
    end

    def self.endpoint_api
      'api/v2'
    end

    def self.headers
      {'Content-Type' => 'application/json'}
    end

    def initialize(query_params = '')
      @query_params = query_params
    end

    def connection
      @connection ||= Faraday.new(url: self.class.endpoint, headers: self.class.headers)
    end

    def get(path)
      connection.get self.class.endpoint_api + path + query_params
    end
  end
