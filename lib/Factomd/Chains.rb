require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Chains

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def chainHead(chainid)
    hash = @h.call("chain-head",{"chainid": chainid})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def commitChain(message)
    hash = @h.call("commit-chain",{"message": message})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def commitEntry(message)
    hash = @h.call("commit-entry",{"message": message})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def currentMinute()
    hash = @h.call("current-minute",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def revealChain(entry)
    hash = @h.call("reveal-chain",{"entry": entry})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def revealEntry(entry)
    hash = @h.call("reveal-entry",{"entry": entry})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def sendRawMessage(message)
    hash = @h.call("send-raw-message",{"message": message})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end