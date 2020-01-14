class RcEntry < Dry::Struct
  attribute :entryhash?, Types::String
  attribute :raw?, Types::String

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      raw: d.has_key?("raw") ? d.fetch("raw") : nil,
      entryhash: d.has_key?("entryhash") ? d.fetch("entryhash") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "raw" => @raw,
      "entryhash" => @entryhash,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Receipt < Dry::Struct
  attribute :entry?, RcEntry
  attribute :merklebranch?, Types::Array
  attribute :entryblockkeymr?, Types::String
  attribute :directoryblockkeymr?, Types::String
  attribute :directoryblockheight?, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      entry: d.has_key?("entry") ? Entry.from_json!(d.fetch("entry")) : nil,
      merklebranch: d.has_key?("merklebranch") ? d.fetch("merklebranch") : [],
      entryblockkeymr: d.has_key?("entryblockkeymr") ? d.fetch("entryblockkeymr") : nil,
      directoryblockkeymr: d.has_key?("directoryblockkeymr") ? d.fetch("directoryblockkeymr") : nil,
      directoryblockheight: d.has_key?("directoryblockheight") ? d.fetch("directoryblockheight") : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "entry" => @entry.to_dynamic,
      "merklebranch" => @merklebranch,
      "entryblockkeymr" => @entryblockkeymr,
      "directoryblockkeymr" => @directoryblockkeymr,
      "directoryblockheight" => @directoryblockheight,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class ReceiptResponse < Dry::Struct
  attribute :receipt?, Receipt

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if (jsonData.has_key? "result")
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
      receipt: d.has_key?("receipt") ? Entry.from_json!(d.fetch("receipt")) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "receipt" => receipt.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
