require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class WalletAddress

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def address(address)
    hash = @h.call("address",{"address": address} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def allAddresses
    hash = @h.call("all-addresses",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def generateEcAddress
    hash = @h.call("generate-ec-address", {} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def generateFactoidAddress
    hash = @h.call("generate-factoid-address", {} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def importPrivateKey(privateKey)
    hash = @h.call("import-addresses", {"addresses":[{"secret":privateKey}]} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def importKoinify(words)
    hash = @h.call("import-koinify", {"words":words} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def generateIdentityKey
    hash = @h.call("generate-identity-key", {} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def importIdentityKeys(secret1, secret2)
    hash = @h.call("import-identity-keys", {"keys":[{"secret":secret1},{"secret":secret2}]})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def removeAddress(address)
    hash = @h.call("remove-address", {"address": address})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def removeIdentityKey(public)
    hash = @h.call("remove-identity-key", {"public": public})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end