require_relative '../lib/Debug//Debug'
require_relative '../lib/config'

config = Config.new

# config.setHost("http://abc.com")
# config.setPort(8000)
# config.setWalletdPort(8009)

debug = Debug.new(config)

# holdingQueue
# res = debug.holdingQueue
# puts res.Messages

# networkInfo
# puts(debug.networkInfo.NetworkNumber)

# predictiveFer
# puts(debug.predictiveFer.PredictiveFER)

# auditServers
# puts(debug.auditServers.AuditServers)

# federatedServers
# puts(debug.federatedServers.FederatedServers)

# configuration
# puts(debug.configuration.App)

# processList
# puts(debug.processList)

# authorities
# puts(debug.authorities.Authorities)

# reloadConfiguration
# puts(debug.reloadConfiguration.App)

# dropRate
# puts(debug.dropRate.DropRate)

# setDropRate
# puts(debug.setDropRate(10).DropRate)

# delay
# puts(debug.delay.Delay)

# setDelay
# puts(debug.setDelay(10).Delay)

# summary
# puts(debug.summary.Summary)

# messages
# puts(debug.messages.Messages)