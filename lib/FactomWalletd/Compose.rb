require "uri"
require "net/http"
require_relative "../jsonrpc"
require_relative "../Response/Common"
require_relative "../Response/Factom/FactomChain"

class Compose
  def initialize(config)
    @host = "#{config.getHost}:#{config.getWalletdPort}/v2"
    @h = JsonRPC.new(@host)
  end

  def composeChain(ecpub, extids)
    extids = extids.unpack("b8B8")
    hash = @h.call("compose-chain", { "chain": { "firstentry": { "extids": extids, "content": extids[1] + extids[0] } }, "ecpub": ecpub })
    FactomChainResponse.from_json!(hash)
  end

  def composeEntry(chainId, ecpub)
    hash = @h.call("compose-entry", { "entry": { "chainid": chainId, "extids": ["cd90", "90cd"], "content": "abcdef" }, "ecpub": ecpub })
    FactomChainResponse.from_json!(hash)
  end

  def composeTransaction(txname)
    hash = @h.call("compose-transaction", { "tx-name": txname })
    ComposeTransactionResponse.from_json!(hash)
  end

  def composeIdentityAttribute(receiverChainid, destinationChainid, attributes, signerkey, signerChainid, ecpub, force)
    hash = @h.call("compose-identity-attribute", {
      "receiver-chainid": receiverChainid,
      "destination-chainid": destinationChainid,
      "attributes": attributes,
      "signerkey": signerkey,
      "signer-chainid": signerChainid,
      "ecpub": ecpub, "force": force,
    })
    FactomChainResponse.from_json!(hash)
  end

  def composeIdentityAttributeEndorsement(entryHash, destinationChainid, signerkey, signerChainid, ecpub, force)
    hash = @h.call("compose-identity-attribute-endorsement", {
      "destination-chainid": destinationChainid,
      "entry-hash": entryHash,
      "signerkey": signerkey,
      "signer-chainid": signerChainid,
      "ecpub": ecpub, "force": force,
    })
    FactomChainResponse.from_json!(hash)
  end

  def composeIdentityChain(names, pubkeys, ecpub, force)
    hash = @h.call("compose-identity-chain", {
      "name": names,
      "pubkeys": pubkeys,
      "ecpub": ecpub, "force": force,
    })
    FactomChainResponse.from_json!(hash)
  end

  def composeIdentityKeyReplacement(chainid, oldkey, newkey, signerkey, ecpub, force)
    hash = @h.call("compose-identity-key-replacement", {
      "chainid": chainid,
      "oldkey": oldkey,
      "newkey": newkey,
      "signerkey": signerkey,
      "ecpub": ecpub, "force": force,
    })
    FactomChainResponse.from_json!(hash)
  end
end
