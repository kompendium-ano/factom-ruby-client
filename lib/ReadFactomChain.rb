require 'uri'
require 'net/http'
require_relative 'config'

class ReadFactomChain

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @whost="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def readChainEntry(entryHash)
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\n    \"jsonrpc\": \"2.0\",\n    \"id\": 0,\n    \"method\": \"entry\",\n    \"params\": {\n        \"hash\": \"#{entryHash}\"\n    }\n}"

    response = http.request(request)
    return response.read_body
  end
end