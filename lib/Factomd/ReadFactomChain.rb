require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Entry/Entry'

class ReadFactomChain

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @client = JsonRPC.new(@host)
  end

  def readChainEntry(entryHash)
    hash = @client.call("entry", {"hash": entryHash} )
    EntryResponse.from_json!(hash)
  end
end