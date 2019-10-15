require 'uri'
require 'net/http'
require_relative 'config'
require_relative '../lib/jsonrpc'

class ReadFactomChain

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @client = JsonRPC.new(@host)
  end

  def readChainEntry(entryHash)
    return @client.call("entry", {"hash": entryHash} )
  end
end