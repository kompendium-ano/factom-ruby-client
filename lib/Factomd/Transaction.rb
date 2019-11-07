require 'uri'
require 'net/http'
require "json"
require_relative '../jsonrpc'
require_relative '../FactomWalletd/WalletTransactions'

class Transaction

  def initialize(config)
    @config=config
    @host="#{config.getHost}:#{config.getPort}/v2"
    @client = JsonRPC.new(@host)
  end

  def factoidSubmit(params)
    hash = @client.call("factoid-submit", params )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def sendTransaction(data)
    data = data[0]
    obj = WalletTransaction.new(@config)
    newTx = obj.newTransaction(data['txname'])
    input = obj.addInput(data['txname'], data['inputAddress'], data['inputAmount'])
    output = obj.addOutput(data['txname'], data['outputAddress'], data['outputAmount'])
    cpTx = obj.composeTransaction(data['txname'])
    postData = cpTx.result.params
    tx = self::factoidSubmit(postData)
    hash = tx
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def pendingTransactions(address)
    hash = @client.call("pending-transactions", {"address": address} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def transaction(hash)
    hash = @client.call("transaction", {"hash": hash} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end