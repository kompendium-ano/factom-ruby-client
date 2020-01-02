require 'uri'
require 'net/http'
require_relative '../jsonrpc'
require_relative '../Response/Common'
require_relative '../Response/Debug/HoldingQueue'
require_relative '../Response/Debug/NetworkInfo'
require_relative '../Response/Debug/PredictiveFER'
require_relative '../Response/Debug/AuditServer'
require_relative '../Response/Debug/FederatedServers'
require_relative '../Response/Debug/Configuration'
require_relative '../Response/Debug/Authorities'
require_relative '../Response/Debug/DropRate'
require_relative '../Response/Debug/Delay'
require_relative '../Response/Debug/Summary'
require_relative '../Response/Debug/Message'

class Debug

  def initialize(config)
    @host="#{config.getHost}:#{config.getPort}/debug"
    puts @host
    @h = JsonRPC.new(@host)
  end

  def holdingQueue
    hash = @h.call("holding-queue",{} )
    HoldingResponse.from_json!(hash)
  end

  def networkInfo
    hash = @h.call("network-info",{})
    NetworkInfoResponse.from_json!(hash)
  end

  def predictiveFer
    hash = @h.call("predictive-fer",{})
    PredictiveFERResponse.from_json!(hash)
  end

  def auditServers
    hash = @h.call("audit-servers",{} )
    AuditServersResponse.from_json!(hash)
  end

  def federatedServers
    hash = @h.call("federated-servers",{})
    FederatedServersResponse.from_json!(hash)
  end

  def configuration
    hash = @h.call("configuration",{})
    ConfigurationResponse.from_json!(hash)
  end

  def processList
    hash = @h.call("process-list",{} )
    JSON.parse(hash.to_json, object_class: OpenStruct)
  end

  def authorities
    hash = @h.call("authorities",{})
    AuthoritiesResponse.from_json!(hash)
  end

  def reloadConfiguration
    hash = @h.call("reload-configuration",{})
    ConfigurationResponse.from_json!(hash)
  end

  def dropRate
    hash = @h.call("drop-rate",{} )
    DropRateResponse.from_json!(hash)
  end

  def setDropRate(droprate)
    hash = @h.call("set-drop-rate",{"DropRate":droprate})
    DropRateResponse.from_json!(hash)
  end

  def delay
    hash = @h.call("delay",{})
    DelayResponse.from_json!(hash)
  end

  def setDelay(delay)
    hash = @h.call("set-delay",{"Delay":delay} )
    DelayResponse.from_json!(hash)
  end

  def summary
    hash = @h.call("summary",{})
    SummaryResponse.from_json!(hash)
  end

  def messages
    hash = @h.call("messages",{})
    MessageResponse.from_json!(hash)
  end
end