require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Entry/EntryAck'
require_relative '../Response/Entry/Entry'
require_relative '../Response/Entry/EntryBlock'
require_relative '../Response/Entry/EntryCreditBlock'
require_relative '../Response/Entry/EntryCreditRate'

class Entry

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def entry(hash)
    hash = @h.call("entry",{"hash": hash} )
    EntryResponse.from_json!(hash)
  end

  def entryAck(txid)
    hash = @h.call("entry-ack",{"txid": txid} )
    EntryAckResponse.from_json!(hash)
  end

  def entryBlock(keymr)
    hash = @h.call("entry-block",{"keymr": keymr} )
    EntryBlockResponse.from_json!(hash)
  end

  def entrycreditBlock(keymr)
    hash = @h.call("entrycredit-block",{"keymr": keymr} )
    EntryCreditBlockResponse.from_json!(hash)
  end

  def entryCreditRate()
    hash = @h.call("entry-credit-rate",{} )
    EntryCreditRateResponse.from_json!(hash)
  end

  def pendingEntries()
    hash = @h.call("pending-entries",{} )
    # JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end