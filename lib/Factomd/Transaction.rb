require 'uri'
require 'net/http'
require_relative '../config'
require "json"
require_relative '../jsonrpc'
require_relative '../FactomWalletd/WalletTransactions'

class Transaction

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @client = JsonRPC.new(@host)
  end

  def factoidSubmit(params)
    return @client.call("factoid-submit", params )
  end

  def sendTransaction(data)
    data = data[0]
    obj = WalletTransaction.new
    newTx = obj.newTransaction(data['txname'])
    input = obj.addInput(data['txname'], data['inputAddress'], data['inputAmount'])
    output = obj.addOutput(data['txname'], data['outputAddress'], data['outputAmount'])
    cpTx = obj.composeTransaction(data['txname'])
    postData = cpTx['result']['params']
    tx = self::factoidSubmit(postData)
    return tx
  end

  def pendingTransactions(address)
    return @client.call("pending-transactions", {"address": address} )
  end

  def transaction(hash)
    return @client.call("transaction", {"hash": hash} )
  end
end