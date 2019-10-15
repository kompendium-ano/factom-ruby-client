require 'uri'
require 'net/http'
require_relative 'config'
require_relative '../lib/jsonrpc'

class FactomBalance

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getFactoidAddressBalance(address)
    return @h.call("factoid-balance", {"address": address} )
  end

  def getECAddressBalance(address)
    return @h.call("entry-credit-balance", {"address": address} )
  end

end