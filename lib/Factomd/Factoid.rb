require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Factoid/FactoidAck'
require_relative '../Response/Factoid/FactoidBlock'
require_relative '../Response/Factoid/FactoidHeights'

class Factoid

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def factoidAck(txid)
    hash = @h.call("factoid-ack",{"txid": txid} )
    FactoidAckResponse.from_json!(hash)
  end

  def factoidBlock(keymr)
    hash = @h.call("factoid-block",{"keymr": keymr} )
    FactoidBlockResponse.from_json!(hash)
  end

  def fblockByHeight(height)
    hash = @h.call("fblock-by-height",{"height": height} )
    FactoidBlockResponse.from_json!(hash)
  end

  def heights()
    hash = @h.call("heights",{} )
    FactoidHeightsResponse.from_json!(hash)
  end
end