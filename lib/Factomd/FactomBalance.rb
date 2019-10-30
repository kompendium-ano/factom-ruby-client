require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class FactomBalance

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getFactoidAddressBalance(address)
    return @h.call("factoid-balance", {"address": address} )
  end

  def getECAddressBalance(address)
    return @h.call("entry-credit-balance", {"address": address} )
  end

  def multiFctBalance(addresses)
    return @h.call("multiple-fct-balances", {"addresses": addresses} )
  end

  def multiEcBalance(addresses)
    return @h.call("multiple-ec-balances", {"addresses": addresses} )
  end

end