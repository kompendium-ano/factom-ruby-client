require 'uri'
require 'net/http'
require_relative 'config'
require_relative '../lib/jsonrpc'

class Chains

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def chainHead(chainid)
    return @h.call("chain-head",{"chainid": chainid})
  end

  def commitChain(message)
    return @h.call("commit-chain",{"message": message})
  end

  def commitEntry(message)
    return @h.call("commit-entry",{"message": message})
  end
end