require 'uri'
require 'net/http'
require_relative '../jsonrpc'

class Compose

  def initialize(config)
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

  def composeIdentityAttribute(receiverChainid, destinationChainid, attributes, signerkey, signerChainid, ecpub, force)
    return @h.call("compose-identity-attribute", {
        "receiver-chainid": receiverChainid,
        "destination-chainid": destinationChainid,
        "attributes": attributes,
        "signerkey": signerkey,
        "signer-chainid": signerChainid,
        "ecpub": ecpub, "force": force
    })
  end

  def composeIdentityAttributeEndorsement(entryHash, destinationChainid, signerkey, signerChainid, ecpub, force)
    return @h.call("compose-identity-attribute-endorsement", {
        "destination-chainid": destinationChainid,
        "entry-hash": entryHash,
        "signerkey": signerkey,
        "signer-chainid": signerChainid,
        "ecpub": ecpub, "force": force
    })
  end

  def composeIdentityChain(names, pubkeys, ecpub, force)
    return @h.call("compose-identity-chain", {
        "name": names,
        "pubkeys": pubkeys,
        "ecpub": ecpub, "force": force
    })
  end

  def composeIdentityKeyReplacement(chainid, oldkey, newkey, signerkey, ecpub, force)
    return @h.call("compose-identity-key-replacement", {
        "chainid": chainid,
        "oldkey": oldkey,
        "newkey": newkey,
        "signerkey": signerkey,
        "ecpub": ecpub,"force": force
    })
  end
end