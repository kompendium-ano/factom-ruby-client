require 'uri'
require 'net/http'
require_relative 'config'

class FactomAddress

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def generateEcAddress
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\": \"2.0\", \"id\": 0, \"method\": \"generate-ec-address\"}"

    response = http.request(request)
    return response.read_body
  end

  def generateFactoidAddress
    url = URI(@host)

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\": \"2.0\", \"id\": 0, \"method\": \"generate-factoid-address\"}"

    response = http.request(request)
    return response.read_body
  end
end