require 'uri'
require 'net/http'
require_relative 'config'

class ImportAddress

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def importPrivateKey(privateKey)
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\": \"2.0\", \"id\": 0, \"method\": \"import-addresses\", \"params\":{\"addresses\":[{\"secret\":\"#{privateKey}\"}]}}"

    response = http.request(request)
    return response.read_body
  end

end