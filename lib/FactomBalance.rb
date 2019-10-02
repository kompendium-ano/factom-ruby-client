require 'uri'
require 'net/http'
require_relative 'config'

class FactomBalance

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
  end

  def getFactoidAddressBalance(address)
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\": \"2.0\", \"id\": 0, \"method\": \"factoid-balance\", \"params\":{\"address\":\"#{address}\"}}"

    response = http.request(request)
    return response.read_body
  end

  def getECAddressBalance(address)
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\": \"2.0\", \"id\": 0, \"method\": \"entry-credit-balance\", \"params\":{\"address\":\"#{address}\"}}"

    response = http.request(request)
    return response.read_body
  end

end