require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Transaction/ComposeTransaction'
require_relative '../Response/Transaction/NewTransaction'
require_relative '../Response/Transaction/AddInputResponse'
require_relative '../Response/Transaction/TmpTransaction'
require_relative '../Response/Transaction/Transactions'
require_relative '../Response/Transaction/SignData'

class WalletTransaction

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def addEcOutput(txname, address, amount)
    hash = @h.call("add-ec-output",{"tx-name": txname, "address": address, "amount": amount} )
    NewTransactionResponse.from_json!(hash)
  end

  def addFee(txname, address)
    hash = @h.call("add-fee",{"tx-name": txname, "address": address})
    AddInputResponse.from_json!(hash)
  end

  def newTransaction(txname)
    hash = @h.call("new-transaction", {"tx-name": txname} )
    NewTransactionResponse.from_json!(hash)
  end

  def addInput(txname, inputAddress, amount)
    hash = @h.call("add-input", {"tx-name": txname, "address":inputAddress, "amount": amount} )
    AddInputResponse.from_json!(hash)
  end

  def addOutput(txname, outputAddress, amount)
    hash = @h.call("add-output", {"tx-name": txname, "address":outputAddress, "amount": amount} )
    AddInputResponse.from_json!(hash)
  end

  def signTransaction(txname)
    hash = @h.call("sign-transaction", {"tx-name": txname} )
    AddInputResponse.from_json!(hash)
  end

  def composeTransaction(txname)
    hash = @h.call("compose-transaction", {"tx-name": txname} )
    ComposeTransactionResponse.from_json!(hash)
  end

  def deleteTransaction(txname)
    hash = @h.call("delete-transaction", {"tx-name": txname} )
    AddInputResponse.from_json!(hash)
  end

  def subFee(txname, address)
    hash = @h.call("sub-fee", {"tx-name": txname, "address": address} )
    AddInputResponse.from_json!(hash)
  end

  def signTransaction(txname)
    hash = @h.call("sign-transaction", {"tx-name": txname} )
    AddInputResponse.from_json!(hash)
  end

  def tmpTransactions
    hash = @h.call("tmp-transactions", {} )
    TmpTransactionResponse.from_json!(hash)
  end

  def transactionsByRange(startLimit, endLimit)
    hash = @h.call("transactions", {"range":{"start":startLimit,"end":endLimit}} )
    TmpTransactionResponse.from_json!(hash)
  end

  def transactionsByTxid(txid)
    hash = @h.call("transactions", {"range":{"txid":txid}} )
    TmpTransactionResponse.from_json!(hash)
  end

  def transactionsByAddress(address)
    hash = @h.call("transactions", {"range":{"address":address}} )
    TmpTransactionResponse.from_json!(hash)
  end

  def allTransactions
    hash = @h.call("transactions", {} )
    TransactionsResponse.from_json!(hash)
  end

  def signData(signer, data)
    hash = @h.call("sign-data", {"signer": signer, "data": data} )
    SignDataResponse.from_json!(hash)
  end
end