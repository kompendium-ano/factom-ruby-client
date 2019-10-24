require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class Wallet

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def walletBackup
    return @h.call("wallet-backup",{} )
  end

  def walletBalances
    return @h.call("wallet-balances",{})
  end

  def errors(method)
    return @h.call(method,{})
  end

  def unlockWallet(passphrase, timeout)
    return @h.call("unlock-wallet",{"passphrase": passphrase, "timeout": timeout})
  end
end