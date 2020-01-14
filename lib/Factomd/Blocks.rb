require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Block/ABlockByHeight'
require_relative '../Response/Block/DBlockByHeight'
require_relative '../Response/Entry/EntryAck'
require_relative '../Response/Block/DirectoryBlock'
require_relative '../Response/Block/DirectoryBlockHead'
require_relative '../Response/Entry/EntryCreditBlock'

class Blocks

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def ablockByHeight
    hash = @h.call("ablock-by-height",{"height":1} )
    ABlockByHeightResponse.from_json!(hash)
  end

  def ack(hash, chainid)
    hash = @h.call("ack",{"hash": hash, "chainid": chainid, "fulltransaction": ""})
    EntryAckResponse.from_json!(hash)
  end

  def adminBlock(keymr)
    hash = @h.call("admin-block",{"keymr": keymr})
    ABlockByHeightResponse.from_json!(hash)
  end

  def dblockByHeight(height)
    hash = @h.call("dblock-by-height",{"height": height})
    DBlockByHeightResponse.from_json!(hash)
  end

  def directoryBlock(keymr)
    hash = @h.call("directory-block",{"keymr": keymr})
    DirectoryBlockResponse.from_json!(hash)
  end

  def directoryBlockHead()
    hash = @h.call("directory-block-head",{})
    DirectoryBlockHeadResponse.from_json!(hash)
  end

  def ecblockByHeight(height)
    hash = @h.call("ecblock-by-height",{"height": height})
    EntryCreditBlockResponse.from_json!(hash)
  end
end