require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Factoid

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def factoidAck(txid)
    hash = @h.call("factoid-ack",{"txid": txid} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def factoidBlock(keymr)
    hash = @h.call("factoid-block",{"keymr": keymr} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def fblockByHeight(height)
    hash = @h.call("fblock-by-height",{"height": height} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def heights()
    hash = @h.call("heights",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end