require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Others/Properties'
require_relative '../Response/Others/RawData'
require_relative '../Response/Others/Receipt'
require_relative '../Response/Others/Anchors'
require_relative '../Response/Others/Diagnostics'

class Others

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def properties
    hash = @h.call("properties",{} )
    PropertiesResponse.from_json!(hash)
  end

  def rawData(hash)
    hash = @h.call("raw-data",{"hash": hash})
    RawDataResponse.from_json!(hash)
  end

  def receipt(hash)
    hash = @h.call("receipt",{"hash": hash})
    ReceiptResponse.from_json!(hash)
  end

  def anchors(hash)
    hash = @h.call("anchors",{"hash": hash})
    AnchorResponse.from_json!(hash)
  end

  def diagnostics
    hash = @h.call("diagnostics",{})
    DiagnosticsResponse.from_json!(hash)
  end
end