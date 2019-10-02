require 'uri'
require 'net/http'
require_relative 'config'
require "json"

class CreateFactomChain

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @whost="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def commitChain(data)
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = data

    response = http.request(request)
    return response.read_body
  end

  def createFactomChain(ecpub, extids)
    extids = extids.unpack('b8B8')
    postData = "{\n\"jsonrpc\":\"2.0\",\n\"id\":0,\n\"method\":\"compose-chain\",\n\"params\":{\n\"chain\":{\n\"firstentry\":{\n\"extids\":#{extids},\n\"content\":\"#{extids[1]}#{extids[0]}\"\n}\n},\n\"ecpub\":\"#{ecpub}\"\n}\n}"
    # puts postData
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = postData

    response = http.request(request)
    resp = JSON.parse(response.read_body)

    if (resp["error"])
      return resp["error"]
    else
      commitData = self::commitChain(JSON.generate(resp["result"]["commit"]))
      revealData = self::commitChain(JSON.generate(resp["result"]["reveal"]))

      resData=[
          "jsonrpc"=> "2.0",
          "id"=> 0,
          "result"=> [
              "composeChain"=> resp,
              "commitChain"=> commitData,
              "revealChain"=> revealData
          ]
      ]

      return resData
    end
  end

  def makeFactomEntry(chainid, ecpub)
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\n    \"jsonrpc\": \"2.0\",\n    \"id\": 0,\n    \"method\": \"compose-entry\",\n    \"params\": {\n        \"entry\": {\n            \"chainid\": \"#{chainid}\",\n            \"extids\": [\n                \"cd90\",\n                \"90cd\"\n            ],\n            \"content\": \"abcdef\"\n        },\n        \"ecpub\": \"#{ecpub}\"\n    }\n}"

    response = http.request(request)
    return response.read_body
  end

end