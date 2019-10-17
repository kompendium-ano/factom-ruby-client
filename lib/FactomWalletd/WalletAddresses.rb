require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class WalletAddress

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def address(address)
    return @h.call("address",{"address": address} )
  end

  def allAddresses
    return @h.call("all-addresses",{})
  end

  def generateEcAddress
    return @h.call("generate-ec-address", {} )
  end

  def generateFactoidAddress
    return @h.call("generate-factoid-address", {} )
  end

  def importPrivateKey(privateKey)
    return @h.call("import-addresses", {"addresses":[{"secret":privateKey}]} )
  end

  def importKoinify(words)
    return @h.call("import-koinify", {"words":words} )
  end
end