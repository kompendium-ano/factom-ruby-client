require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Debug

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/debug"
    puts @host
    @h = JsonRPC.new(@host)
  end

  def holdingQueue
    hash = @h.call("holding-queue",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def networkInfo
    hash = @h.call("network-info",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def predictiveFer
    hash = @h.call("predictive-fer",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def auditServers
    hash = @h.call("audit-servers",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def federatedServers
    hash = @h.call("federated-servers",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def configuration
    hash = @h.call("configuration",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def processList
    hash = @h.call("process-list",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def authorities
    hash = @h.call("authorities",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def reloadConfiguration
    hash = @h.call("reload-configuration",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def dropRate
    hash = @h.call("drop-rate",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def setDropRate(droprate)
    hash = @h.call("set-drop-rate",{"DropRate":droprate})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def delay
    hash = @h.call("delay",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def setDelay(delay)
    hash = @h.call("set-delay",{"Delay":delay} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def summary
    hash = @h.call("summary",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def messages
    hash = @h.call("messages",{})
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end
end