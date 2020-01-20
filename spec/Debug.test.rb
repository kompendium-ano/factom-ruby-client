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

puts(debug.networkInfo)

# predictiveFer
puts(debug.predictiveFer)

# auditServers
puts(debug.auditServers)

# federatedServers
puts(debug.federatedServers)

# configuration
puts(debug.configuration)

