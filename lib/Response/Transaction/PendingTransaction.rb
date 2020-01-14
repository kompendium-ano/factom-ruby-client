class PendingTransactionResponse < Dry::Struct
  attribute :transactionid?, Types::String
  attribute :status?, Types::String
  attribute :inputs?, Types::Array
  attribute :outputs?, Types::Array
  attribute :ecoutputs?, Types::Array
  attribute :fees?, Types::Int

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(d.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end

    if(d.length()>0)
      new(
        transactionid: d.has_key?('transactionid') ? d.fetch("transactionid") : nil,
        status: d.has_key?('status') ? d.fetch("status") : nil,
        inputs: d.has_key?('inputs') ? d.fetch("inputs") : nil,
        outputs: d.has_key?('outputs') ? d.fetch("outputs") : nil,
        ecoutputs: d.has_key?('ecoutputs') ? d.fetch("ecoutputs") : nil,
        fees: d.has_key?('fees') ? d.fetch("fees") : 0,
        )
    else
      new(
          transactionid: nil,
          status: nil,
          inputs: nil,
          outputs: nil,
          ecoutputs: nil,
          fees: 0,
          )
    end
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "transactionid"  => @transactionid,
        "status"  => @status,
        "inputs"  => @inputs,
        "outputs"  => @outputs,
        "ecoutputs"  => @ecoutputs,
        "fees"  => @fees,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end