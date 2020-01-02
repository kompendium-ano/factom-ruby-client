require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Wallet/WalletBackup'
require_relative '../Response/Wallet/WalletBalances'
require_relative '../Response/Wallet/UnlockWallet'

class Wallet

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def walletBackup
    hash = @h.call("wallet-backup",{} )
    WalletBackupResponse.from_json!(hash)
  end

  def walletBalances
    hash = @h.call("wallet-balances",{})
    WalletBalanceResponse.from_json!(hash)
  end

  def errors(method)
    hash = @h.call(method,{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def unlockWallet(passphrase, timeout)
    hash = @h.call("unlock-wallet",{"passphrase": passphrase, "timeout": timeout})
    UnlockWalletResponse.from_json!(hash)
  end
end