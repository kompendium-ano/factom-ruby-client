require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class WalletTransaction

  def initialize(config)
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def addEcOutput(txname, address, amount)
    hash = @h.call("add-ec-output",{"tx-name": txname, "address": address, "amount": amount} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def addFee(txname, address)
    hash = @h.call("add-fee",{"tx-name": txname, "address": address})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def newTransaction(txname)
    hash = @h.call("new-transaction", {"tx-name": txname} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def addInput(txname, inputAddress, amount)
    hash = @h.call("add-input", {"tx-name": txname, "address":inputAddress, "amount": amount} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def addOutput(txname, outputAddress, amount)
    hash = @h.call("add-output", {"tx-name": txname, "address":outputAddress, "amount": amount} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def signTransaction(txname)
    hash = @h.call("sign-transaction", {"tx-name": txname} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def composeTransaction(txname)
    hash = @h.call("compose-transaction", {"tx-name": txname} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def deleteTransaction(txname)
    hash = @h.call("delete-transaction", {"tx-name": txname} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def subFee(txname, address)
    hash = @h.call("sub-fee", {"tx-name": txname, "address": address} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def signTransaction(txname)
    hash = @h.call("sign-transaction", {"tx-name": txname} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def tmpTransactions
    hash = @h.call("tmp-transactions", {} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def transactionsByRange(startLimit, endLimit)
    hash = @h.call("transactions", {"range":{"start":startLimit,"end":endLimit}} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def transactionsByTxid(txid)
    hash = @h.call("transactions", {"range":{"txid":txid}} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def transactionsByAddress(address)
    hash = @h.call("transactions", {"range":{"address":address}} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def allTransactions
    hash = @h.call("transactions", {} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def signData(signer, data)
    hash = @h.call("sign-data", {"signer": signer, "data": data} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end