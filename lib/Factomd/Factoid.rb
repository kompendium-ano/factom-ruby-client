require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Factoid

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def factoidAck(txid)
    return @h.call("factoid-ack",{"txid": txid} )
  end

  def factoidBlock(keymr)
    return @h.call("factoid-block",{"keymr": keymr} )
  end

  def fblockByHeight(height)
    return @h.call("fblock-by-height",{"height": height} )
  end

  def heights()
    return @h.call("heights",{} )
  end
end