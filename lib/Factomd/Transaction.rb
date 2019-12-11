require 'uri'
require 'net/http'
require "json"
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../FactomWalletd/WalletTransactions'
require_relative '../Response/Transaction/FactoidSubmit'
require_relative '../Response/Transaction/PendingTransaction'
require_relative '../Response/Transaction/Transactions'

class Transaction

  def initialize(config)
    @config=config
    @host="#{config.getHost}:#{config.getPort}/v2"
    @client = JsonRPC.new(@host)
  end

  def factoidSubmit(params)
    hash = @client.call("factoid-submit", {"transaction": params} )
    FactoidSubmitResponse.from_json!(hash)
  end

  def sendTransaction(data)
    data = data[0]
    obj = WalletTransaction.new(@config)
    newTx = obj.newTransaction(data['txname'])
    input = obj.addInput(data['txname'], data['inputAddress'], data['inputAmount'])
    output = obj.addOutput(data['txname'], data['outputAddress'], data['outputAmount'])
    cpTx = obj.composeTransaction(data['txname'])
    postData = cpTx.params.transaction
    self::factoidSubmit(postData)
    # hash = tx
    # JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def pendingTransactions(address)
    hash = @client.call("pending-transactions", {"address": address} )
    PendingTransactionResponse.from_json!(hash)
  end

  def transaction(hash)
    hash = @client.call("transaction", {"hash": hash} )
    TransactionsResponse.from_json!(hash)
  end
end