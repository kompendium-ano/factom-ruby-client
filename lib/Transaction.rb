require 'uri'
require 'net/http'
require_relative 'config'
require "json"

class Transaction

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @whost="#{config.getHost}:#{config.getWalletdPort}/v2"
  end

  def newTransactionn(txname)
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\": \"2.0\", \"id\": 0, \"method\":\"new-transaction\", \"params\":{\"tx-name\":\"#{txname}\"}}"

    response = http.request(request)
    return response.read_body
  end

  def addInput(txname, inputAddress, amount)
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\":\"2.0\",\"id\":0,\"method\":\"add-input\",\"params\":\n{\"tx-name\":\"#{txname}\",\"address\":\"#{inputAddress}\",\"amount\":#{amount}}}"

    response = http.request(request)
    return response.read_body
  end

  def addOutput(txname, outputAddress, amount)
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\":\"2.0\",\"id\":0,\"method\":\"add-output\",\"params\":\n{\"tx-name\":\"#{txname}\",\"address\":\"#{outputAddress}\",\"amount\":#{amount}}}"

    response = http.request(request)
    return response.read_body
  end

  def signTransaction(txname)
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\":\"2.0\", \"id\":0, \"method\":\"sign-transaction\", \"params\":{\"tx-name\":\"#{txname}\"}}"

    response = http.request(request)
    return response.read_body
  end

  def composeTransaction(txname)
    url = URI("#{@whost}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = "{\"jsonrpc\":\"2.0\", \"id\":0, \"method\":\"compose-transaction\", \"params\":{\"tx-name\":\"#{txname}\"}}"

    response = http.request(request)
    return response.read_body
  end

  def factoidSubmit(postData)
    url = URI("#{@host}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request.body = postData

    response = http.request(request)
    return response.read_body
  end

  def sendTransaction(data)
    data = data[0]
    newTx = self::newTransactionn(data['txname'])
    input = self::addInput(data['txname'], data['inputAddress'], data['inputAmount'])
    output = self::addOutput(data['txname'], data['outputAddress'], data['outputAmount'])
    cpTx = self::composeTransaction(data['txname'])
    cpTx = JSON.parse(cpTx)
    postData = JSON.generate(cpTx['result'])
    tx = self::factoidSubmit(postData)

    return tx
  end
end