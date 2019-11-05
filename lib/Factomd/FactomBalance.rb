require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class FactomBalance

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getFactoidAddressBalance(address)
    hash = @h.call("factoid-balance", {"address": address} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def getECAddressBalance(address)
    hash = @h.call("entry-credit-balance", {"address": address} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def multiFctBalance(addresses)
    hash = @h.call("multiple-fct-balances", {"addresses": addresses} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def multiEcBalance(addresses)
    hash = @h.call("multiple-ec-balances", {"addresses": addresses} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

end