require 'uri'
require 'net/http'
require_relative '../config'
require "json"
require_relative '../jsonrpc'

class CreateFactomChain

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @whost="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def commitChain(params)
    client = JsonRPC.new(@host)
    return client.call("commit-chain", params)
  end

  def revealChain(params)
    client = JsonRPC.new(@host)
    return client.call("reveal-chain", params)
  end

  def createFactomChain(ecpub, extids)
    client = JsonRPC.new(@whost)
    extids = extids.unpack('b8B8')
    resp = client.call("compose-chain",{"chain":{"firstentry":{"extids":extids,"content":extids[1]+extids[0]}},"ecpub":ecpub})

    if (resp["error"])
      return resp["error"]
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

      return resData
    end
  end

  def makeFactomEntry(chainid, ecpub)
    client = JsonRPC.new(@whost)
    return client.call("compose-entry",{"entry": {"chainid": "#{chainid}","extids": ["cd90","90cd"],"content": "abcdef"},"ecpub": "#{ecpub}"})
  end

end