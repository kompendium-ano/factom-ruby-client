require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class WalletOthers

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getHeight
    return @h.call("get-height",{} )
  end

  def properties
    return @h.call("properties",{})
  end

  def activeIdentityKeys(chainid, height)
    return @h.call("active-identity-keys",{"chainid": chainid, "height": height})
  end

  def allIdentityKeys
    return @h.call("all-identity-keys",{})
  end
end