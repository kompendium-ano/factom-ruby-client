require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class Blocks

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def ablockByHeight
    return @h.call("ablock-by-height",{"height":1} )
  end

  def ack(hash, chainid)
    return @h.call("ack",{"hash": hash, "chainid": chainid, "fulltransaction": ""})
  end

  def adminBlock(keymr)
    return @h.call("admin-block",{"keymr": keymr})
  end

  def dblockByHeight(height)
    return @h.call("dblock-by-height",{"height": height})
  end

  def directoryBlock(keymr)
    return @h.call("directory-block",{"keymr": keymr})
  end

  def directoryBlockHead()
    return @h.call("directory-block-head",{})
  end

  def ecblockByHeight(height)
    return @h.call("ecblock-by-height",{"height": height})
  end
end