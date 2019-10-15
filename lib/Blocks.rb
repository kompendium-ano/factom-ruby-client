require 'uri'
require 'net/http'
require_relative 'config'
require_relative '../lib/jsonrpc'

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
end