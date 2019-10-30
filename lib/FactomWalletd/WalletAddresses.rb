require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class WalletAddress

  def initialize(config)
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

  def generateIdentityKey
    return @h.call("generate-identity-key", {} )
  end

  def importIdentityKeys(secret1, secret2)
    return @h.call("import-identity-keys", {"keys":[{"secret":secret1},{"secret":secret2}]})
  end

  def removeAddress(address)
    return @h.call("remove-address", {"address": address})
  end

  def removeIdentityKey(public)
    return @h.call("remove-identity-key", {"public": public})
  end
end