require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class ReadFactomChain

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @client = JsonRPC.new(@host)
  end

  def readChainEntry(entryHash)
    hash = @client.call("entry", {"hash": entryHash} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end