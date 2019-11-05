require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class WalletOthers

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getHeight
    hash = @h.call("get-height",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def properties
    hash = @h.call("properties",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def activeIdentityKeys(chainid, height)
    hash = @h.call("active-identity-keys",{"chainid": chainid, "height": height})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def allIdentityKeys
    hash = @h.call("all-identity-keys",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end