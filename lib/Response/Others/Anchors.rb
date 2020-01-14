class Ethereum < Dry::Struct
  attribute :recordheight?, Types::Int
  attribute :dbheightmax?, Types::Int
  attribute :dbheightmin?, Types::Int
  attribute :windowmr?, Types::String
  attribute :merklebranch?, Types::Array
  attribute :contractaddress?, Types::String
  attribute :txid?, Types::String
  attribute :blockhash?, Types::String
  attribute :txindex?, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      recordheight: d.has_key?("recordheight") ? d.fetch("recordheight") : 0,
      dbheightmax: d.has_key?("dbheightmax") ? d.fetch("dbheightmax") : 0,
      dbheightmin: d.has_key?("dbheightmin") ? d.fetch("dbheightmin") : 0,
      windowmr: d.has_key?("windowmr") ? d.fetch("windowmr") : nil,
      merklebranch: d.has_key?("merklebranch") ? d.fetch("merklebranch") : nil,
      contractaddress: d.has_key?("contractaddress") ? d.fetch("contractaddress") : nil,
      txid: d.has_key?("txid") ? d.fetch("txid") : nil,
      blockhash: d.has_key?("blockhash") ? d.fetch("blockhash") : nil,
      txindex: d.has_key?("txindex") ? d.fetch("txindex") : 0,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "recordheight" => @recordheight,
      "dbheightmax" => @dbheightmax,
      "dbheightmin" => @dbheightmin,
      "windowmr" => @windowmr,
      "merklebranch" => @merklebranch,
      "contractaddress" => @contractaddress,
      "txid" => @txid,
      "blockhash" => @blockhash,
      "txindex" => @txindex,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Bitcoin < Dry::Struct
  attribute :transactionhash?, Types::String
  attribute :blockhash?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      transactionhash: d.has_key?("transactionhash") ? d.fetch("transactionhash") : nil,
      blockhash: d.has_key?("blockhash") ? d.fetch("blockhash") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "transactionhash" => @transactionhash,
      "blockhash" => @blockhash,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class AnchorResponse < Dry::Struct
  attribute :directoryblockheight, Types::Int
  attribute :directoryblockkeymr, Types::String
  attribute :bitcoin, Bitcoin
  attribute :ethereum, Ethereum

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      directoryblockheight: d.has_key?("directoryblockheight") ? d.fetch("directoryblockheight") : 0,
      directoryblockkeymr: d.has_key?("directoryblockkeymr") ? d.fetch("directoryblockkeymr") : nil,
      bitcoin: d.has_key?("bitcoin") ? Bitcoin.from_json!(d.fetch("bitcoin")) : nil,
      ethereum: d.has_key?("ethereum") ? Ethereum.from_json!(d.fetch("ethereum")) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "directoryblockheight" => @directoryblockheight,
      "directoryblockkeymr" => @directoryblockkeymr,
      "bitcoin" => @bitcoin.to_dynamic,
      "ethereum" => @ethereum.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
