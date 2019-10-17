require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class Others

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def properties
    return @h.call("properties",{} )
  end

  def rawData(hash)
    return @h.call("raw-data",{"hash": hash})
  end

  def receipt(hash)
    return @h.call("receipt",{"hash": hash})
  end
end