require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Others/GetHeight'
require_relative '../Response/Others/WalletProperties'
require_relative '../Response/Wallet/ActiveIdentityKeys'
require_relative '../Response/Wallet/ImportIdentityKey'

class WalletOthers

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def getHeight
    hash = @h.call("get-height",{} )
    GetHeightResponse.from_json!(hash)
  end

  def properties
    hash = @h.call("properties",{})
    WalletPropertiesResponse.from_json!(hash)
  end

  def activeIdentityKeys(chainid, height)
    hash = @h.call("active-identity-keys",{"chainid": chainid, "height": height})
    ActiveIdentityKeysResponse.from_json!(hash)
  end

  def allIdentityKeys
    hash = @h.call("all-identity-keys",{})
    ImportIdentityKeyResponse.from_json!(hash)
  end
end