require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class WalletTransaction

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def addEcOutput(txname, address, amount)
    return @h.call("add-ec-output",{"tx-name": txname, "address": address, "amount": amount} )
  end

  def addFee(txname, address)
    return @h.call("add-fee",{"tx-name": txname, "address": address})
  end

  def newTransaction(txname)
    return @h.call("new-transaction", {"tx-name": txname} )
  end

  def addInput(txname, inputAddress, amount)
    return @h.call("add-input", {"tx-name": txname, "address":inputAddress, "amount": amount} )
  end

  def addOutput(txname, outputAddress, amount)
    return @h.call("add-output", {"tx-name": txname, "address":outputAddress, "amount": amount} )
  end

  def signTransaction(txname)
    return @h.call("sign-transaction", {"tx-name": txname} )
  end

  def composeTransaction(txname)
    return @h.call("compose-transaction", {"tx-name": txname} )
  end

  def deleteTransaction(txname)
    return @h.call("delete-transaction", {"tx-name": txname} )
  end

  def subFee(txname, address)
    return @h.call("sub-fee", {"tx-name": txname, "address": address} )
  end

  def signTransaction(txname)
    return @h.call("sign-transaction", {"tx-name": txname} )
  end

  def tmpTransactions
    return @h.call("tmp-transactions", {} )
  end

  def transactionsByRange(startLimit, endLimit)
    return @h.call("transactions", {"range":{"start":startLimit,"end":endLimit}} )
  end

  def transactionsByTxid(txid)
    return @h.call("transactions", {"range":{"txid":txid}} )
  end

  def transactionsByAddress(address)
    return @h.call("transactions", {"range":{"address":address}} )
  end

  def allTransactions
    return @h.call("transactions", {} )
  end

  def signData(signer, data)
    return @h.call("sign-data", {"signer": signer, "data": data} )
  end
end