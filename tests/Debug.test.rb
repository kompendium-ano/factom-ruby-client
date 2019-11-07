require_relative '../lib/Debug//Debug'
require_relative '../lib/config'

config = Config.new

# config.setHost("http://abc.com")
# config.setPort(8000)
# config.setWalletdPort(8009)

debug = Debug.new(config)

# holdingQueue
res = debug.holdingQueue
p res.result.Messages

# networkInfo
# puts(debug.networkInfo)

# predictiveFer
# puts(debug.predictiveFer)

# auditServers
# puts(debug.auditServers)

# federatedServers
# puts(debug.federatedServers)

# configuration
# puts(debug.configuration)

# processList
# puts(debug.processList)

# authorities
# puts(debug.authorities)

# reloadConfiguration
# puts(debug.reloadConfiguration)

# dropRate
# puts(debug.dropRate)

# setDropRate
# puts(debug.setDropRate(10))

# delay
# puts(debug.delay)

# setDelay
# puts(debug.setDelay(10))

# summary
# puts(debug.summary)

# messages
# puts(debug.messages)