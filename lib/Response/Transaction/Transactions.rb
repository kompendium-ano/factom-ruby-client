class FactoidTransaction < Dry::Struct
  attribute :millitimestamp?, Types::Int
  attribute :inputs?, Types::Array
  attribute :outputs?, Types::Array
  attribute :outecs?, Types::Array
  attribute :rcds?, Types::Array
  attribute :sigblocks?, Types::Array
  attribute :blockheight?, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        millitimestamp: d.has_key?('millitimestamp') ? d.fetch("millitimestamp") : 0,
        inputs: d.has_key?('inputs') ? d.fetch("inputs") : nil,
        outputs: d.has_key?('outputs') ? d.fetch("outputs") : nil,
        outecs: d.has_key?('outecs') ? d.fetch("outecs") : nil,
        rcds: d.has_key?('rcds') ? d.fetch("rcds") : nil,
        sigblocks: d.has_key?('sigblocks') ? d.fetch("sigblocks") : nil,
        blockheight: d.has_key?('blockheight') ? d.fetch("blockheight") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "millitimestamp"  => @millitimestamp,
        "inputs"  => @inputs,
        "outputs"  => @outputs,
        "outecs"  => @outecs,
        "rcds"  => @rcds,
        "sigblocks"  => @sigblocks,
        "blockheight"  => @blockheight,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class TransactionsResponse < Dry::Struct
  attribute :factoidtransaction, FactoidTransaction
  attribute :includedintransactionblock, Types::String
  attribute :includedindirectoryblock, Types::String
  attribute :includedindirectoryblockheight, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    new(
        factoidtransaction: d.has_key?('factoidtransaction') ? FactoidTransaction.from_json!(d.fetch("factoidtransaction")) : nil,
        includedintransactionblock: d.has_key?('includedintransactionblock') ? d.fetch("includedintransactionblock") : nil,
        includedindirectoryblock: d.has_key?('includedindirectoryblock') ? d.fetch("includedindirectoryblock") : nil,
        includedindirectoryblockheight: d.has_key?('includedindirectoryblockheight') ? d.fetch("includedindirectoryblockheight") : 0,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "factoidtransaction"  => @factoidtransaction.to_dynamic,
        "includedintransactionblock"  => @includedintransactionblock,
        "includedindirectoryblock"  => @includedindirectoryblock,
        "includedindirectoryblockheight"  => @includedindirectoryblockheight,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end