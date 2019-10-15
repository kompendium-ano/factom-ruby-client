require 'uri'
require 'net/http'
require_relative 'config'

class ImportAddress

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def importPrivateKey(privateKey)
    return @h.call("import-addresses", {"addresses":[{"secret":privateKey}]} )
  end

end