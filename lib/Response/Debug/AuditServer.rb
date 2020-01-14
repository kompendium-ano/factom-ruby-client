class AuditServersResponse < Dry::Struct
  attribute :AuditServers, Types::Array

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        AuditServers: d.has_key?('AuditServers') ? d.fetch("AuditServers") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "AuditServers"  => @AuditServers,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end