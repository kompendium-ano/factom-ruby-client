require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class WalletOthers

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getHeight
    return @h.call("get-height",{} )
  end

  def properties
    return @h.call("properties",{})
  end
end