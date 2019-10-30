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
    return @h.call("holding-queue",{} )
  end

  def networkInfo
    return @h.call("network-info",{})
  end

  def predictiveFer
    return @h.call("predictive-fer",{})
  end

  def auditServers
    return @h.call("audit-servers",{} )
  end

  def federatedServers
    return @h.call("federated-servers",{})
  end

  def configuration
    return @h.call("configuration",{})
  end

  def processList
    return @h.call("process-list",{} )
  end

  def authorities
    return @h.call("authorities",{})
  end

  def reloadConfiguration
    return @h.call("reload-configuration",{})
  end

  def dropRate
    return @h.call("drop-rate",{} )
  end

  def setDropRate(droprate)
    return @h.call("set-drop-rate",{"DropRate":droprate})
  end

  def delay
    return @h.call("delay",{})
  end

  def setDelay(delay)
    return @h.call("set-delay",{"Delay":delay} )
  end

  def summary
    return @h.call("summary",{})
  end

  def messages
    return @h.call("messages",{})
  end
end