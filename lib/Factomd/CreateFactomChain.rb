require 'uri'
require 'net/http'
require "json"
require_relative '../jsonrpc'

class CreateFactomChain

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @whost="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def commitChain(params)
    client = JsonRPC.new(@host)
    hash = client.call("commit-chain", params)
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def revealChain(params)
    client = JsonRPC.new(@host)
    hash = client.call("reveal-chain", params)
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def createFactomChain(ecpub, extids)
    client = JsonRPC.new(@whost)
    extids = extids.unpack('b8B8')
    resp = client.call("compose-chain",{"chain":{"firstentry":{"extids":extids,"content":extids[1]+extids[0]}},"ecpub":ecpub})

    if (resp["error"])
      hash = resp["error"]
      JSON.parse(hash.to_json, object_class: OpenStruct)
    else
      commitData = self::commitChain(resp["result"]["commit"]["params"])
      revealData = self::revealChain(resp["result"]["reveal"]["params"])

      resData=[
          "jsonrpc"=> "2.0",
          "id"=> 0,
          "result"=> [
              "composeChain"=> resp,
              "commitChain"=> commitData,
              "revealChain"=> revealData
          ]
      ]

      hash = resData
      JSON.parse(hash.to_json, object_class: OpenStruct)
    end
  end

  def makeFactomEntry(chainid, ecpub)
    client = JsonRPC.new(@whost)
    hash = client.call("compose-entry",{"entry": {"chainid": "#{chainid}","extids": ["cd90","90cd"],"content": "abcdef"},"ecpub": "#{ecpub}"})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

end