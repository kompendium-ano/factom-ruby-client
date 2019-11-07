require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Blocks

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def ablockByHeight
    hash = @h.call("ablock-by-height",{"height":1} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def ack(hash, chainid)
    hash = @h.call("ack",{"hash": hash, "chainid": chainid, "fulltransaction": ""})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def adminBlock(keymr)
    hash = @h.call("admin-block",{"keymr": keymr})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def dblockByHeight(height)
    hash = @h.call("dblock-by-height",{"height": height})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def directoryBlock(keymr)
    hash = @h.call("directory-block",{"keymr": keymr})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def directoryBlockHead()
    hash = @h.call("directory-block-head",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def ecblockByHeight(height)
    hash = @h.call("ecblock-by-height",{"height": height})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end