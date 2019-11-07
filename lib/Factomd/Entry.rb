require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Entry

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def entry(hash)
    hash = @h.call("entry",{"hash": hash} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def entryAck(txid)
    hash = @h.call("entry-ack",{"txid": txid} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def entryBlock(keymr)
    hash = @h.call("entry-block",{"keymr": keymr} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def entrycreditBlock(keymr)
    hash = @h.call("entrycredit-block",{"keymr": keymr} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def entryCreditRate()
    hash = @h.call("entry-credit-rate",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def pendingEntries()
    hash = @h.call("pending-entries",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end