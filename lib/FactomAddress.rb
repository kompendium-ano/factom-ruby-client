require 'uri'
require 'net/http'
require_relative 'config'
require_relative '../lib/jsonrpc'

class FactomAddress

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def generateEcAddress
    return @h.call("generate-ec-address", nil )
  end

  def generateFactoidAddress
    return @h.call("generate-factoid-address", nil )
  end
end