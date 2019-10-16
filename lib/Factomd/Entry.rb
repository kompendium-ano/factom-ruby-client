require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class Entry

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def entry(hash)
    return @h.call("entry",{"hash": hash} )
  end

  def entryAck(txid)
    return @h.call("entry-ack",{"txid": txid} )
  end

  def entryBlock(keymr)
    return @h.call("entry-block",{"keymr": keymr} )
  end

  def entrycreditBlock(keymr)
    return @h.call("entrycredit-block",{"keymr": keymr} )
  end

  def entryCreditRate()
    return @h.call("entry-credit-rate",{} )
  end
end