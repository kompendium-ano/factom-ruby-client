require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Wallet

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def walletBackup
    hash = @h.call("wallet-backup",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def walletBalances
    hash = @h.call("wallet-balances",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def errors(method)
    hash = @h.call(method,{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def unlockWallet(passphrase, timeout)
    hash = @h.call("unlock-wallet",{"passphrase": passphrase, "timeout": timeout})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end