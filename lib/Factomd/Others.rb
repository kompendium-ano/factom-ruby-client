require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Others

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def properties
    hash = @h.call("properties",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def rawData(hash)
    hash = @h.call("raw-data",{"hash": hash})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def receipt(hash)
    hash = @h.call("receipt",{"hash": hash})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def anchors(hash)
    hash = @h.call("anchors",{"hash": hash})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def diagnostics
    hash = @h.call("diagnostics",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end