require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Factom/Balance'
require_relative '../Response/Factom/MultiBalance'

class FactomBalance

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getFactoidAddressBalance(address)
    hash = @h.call("factoid-balance", {"address": address} )
    BalanceResponse.from_json!(hash)
  end

  def getECAddressBalance(address)
    hash = @h.call("entry-credit-balance", {"address": address} )
    BalanceResponse.from_json!(hash)
  end

  def multiFctBalance(addresses)
    hash = @h.call("multiple-fct-balances", {"addresses": addresses} )
    MultiBalanceResponse.from_json!(hash)
  end

  def multiEcBalance(addresses)
    hash = @h.call("multiple-ec-balances", {"addresses": addresses} )
    MultiBalanceResponse.from_json!(hash)
  end

end