require 'uri'
require 'net/http'
require_relative '../config'
require_relative '../jsonrpc'

class Compose

  def initialize
    config = Config.new
    @host="#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def composeChain(ecpub, extids)
    extids = extids.unpack('b8B8')
    return @h.call("compose-chain",{"chain":{"firstentry":{"extids":extids,"content":extids[1]+extids[0]}},"ecpub":ecpub} )
  end

  def composeEntry(chainId, ecpub)
    return @h.call("compose-entry",{ "entry":  {"chainid":chainId,  "extids":["cd90", "90cd"], "content":"abcdef"}, "ecpub":ecpub})
  end

  def composeTransaction(txname)
    return @h.call("compose-transaction", {"tx-name":txname} )
  end
end