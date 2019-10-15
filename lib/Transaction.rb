require 'uri'
require 'net/http'
require_relative 'config'
require "json"
require_relative '../lib/jsonrpc'

class Transaction

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @whost="#{config.getHost}:#{config.getWalletdPort}/v2"
    @client = JsonRPC.new(@host)
    @client2 = JsonRPC.new(@whost)
  end

  def newTransactionn(txname)
    return @client2.call("new-transaction", {"tx-name": txname} )
  end

  def addInput(txname, inputAddress, amount)
    return @client2.call("add-input", {"tx-name": txname, "address":inputAddress, "amount": amount} )
  end

  def addOutput(txname, outputAddress, amount)
    return @client2.call("add-output", {"tx-name": txname, "address":outputAddress, "amount": amount} )
  end

  def signTransaction(txname)
    return @client2.call("sign-transaction", {"tx-name": txname} )
  end

  def composeTransaction(txname)
    return @client2.call("compose-transaction", {"tx-name": txname} )
  end

  def factoidSubmit(params)
    return @client.call("factoid-submit", params )
  end

  def sendTransaction(data)
    data = data[0]
    newTx = self::newTransactionn(data['txname'])
    input = self::addInput(data['txname'], data['inputAddress'], data['inputAmount'])
    output = self::addOutput(data['txname'], data['outputAddress'], data['outputAmount'])
    cpTx = self::composeTransaction(data['txname'])
    postData = cpTx['result']['params']
    tx = self::factoidSubmit(postData)

    return tx
  end
end