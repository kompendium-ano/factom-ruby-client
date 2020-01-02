require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Wallet/GenerateAddress'
require_relative '../Response/Wallet/Addresses'
require_relative '../Response/Wallet/ImportIdentityKey'
require_relative '../Response/Wallet/RemoveAddress'

class WalletAddress

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def address(address)
    hash = @h.call("address",{"address": address} )
    GenerateAddressResponse.from_json!(hash)
  end

  def allAddresses
    hash = @h.call("all-addresses",{})
    AddressResponse.from_json!(hash)
  end

  def generateEcAddress
    hash = @h.call("generate-ec-address", {} )
    GenerateAddressResponse.from_json!(hash)
  end

  def generateFactoidAddress
    hash = @h.call("generate-factoid-address", {} )
    GenerateAddressResponse.from_json!(hash)
  end

  def importPrivateKey(privateKey)
    hash = @h.call("import-addresses", {"addresses":[{"secret":privateKey}]} )
    AddressResponse.from_json!(hash)
  end

  def importKoinify(words)
    hash = @h.call("import-koinify", {"words":words} )
    GenerateAddressResponse.from_json!(hash)
  end

  def generateIdentityKey
    hash = @h.call("generate-identity-key", {} )
    GenerateAddressResponse.from_json!(hash)
  end

  def importIdentityKeys(secret1, secret2)
    hash = @h.call("import-identity-keys", {"keys":[{"secret":secret1},{"secret":secret2}]})
    ImportIdentityKeyResponse.from_json!(hash)
  end

  def removeAddress(address)
    hash = @h.call("remove-address", {"address": address})
    RemoveAddressResponse.from_json!(hash)
  end

  def removeIdentityKey(public)
    hash = @h.call("remove-identity-key", {"public": public})
    RemoveAddressResponse.from_json!(hash)
  end
end