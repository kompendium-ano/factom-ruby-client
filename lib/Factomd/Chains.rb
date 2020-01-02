require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Chain/ChainHead'
require_relative '../Response/Chain/CommitChain'
require_relative '../Response/Chain/CurrentMinute'

class Chains

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def chainHead(chainid)
    hash = @h.call("chain-head",{"chainid": chainid})
    ChainHeadResponse.from_json!(hash)
  end

  def commitChain(message)
    hash = @h.call("commit-chain",{"message": message})
    CommitChainResponse.from_json!(hash)
  end

  def commitEntry(message)
    hash = @h.call("commit-entry",{"message": message})
    CommitChainResponse.from_json!(hash)
  end

  def currentMinute()
    hash = @h.call("current-minute",{})
    CurrentMinuteResponse.from_json!(hash)
  end

  def revealChain(entry)
    hash = @h.call("reveal-chain",{"entry": entry})
    CommitChainResponse.from_json!(hash)
  end

  def revealEntry(entry)
    hash = @h.call("reveal-entry",{"entry": entry})
    CommitChainResponse.from_json!(hash)
  end

  def sendRawMessage(message)
    hash = @h.call("send-raw-message",{"message": message})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end