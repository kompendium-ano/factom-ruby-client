class ConfigurationResponse < Dry::Struct
  attribute :App, Types::Any
  attribute :Peer, Types::Any
  attribute :Log, Types::Any
  attribute :Wallet, Types::Any
  attribute :Walletd, Types::Any

  def self.from_dynamic!(d)
    jsonData = d
    d = Types::Hash[d]
    if(jsonData.has_key? 'result')
      d = d.fetch("result")
    else
      d = d.fetch("error")
    end
    new(
        App: d.has_key?('App') ? d.fetch("App") : nil,
        Peer: d.has_key?('Peer') ? d.fetch("Peer") : nil,
        Log: d.has_key?('Log') ? d.fetch("Log") : nil,
        Wallet: d.has_key?('Wallet') ? d.fetch("Wallet") : nil,
        Walletd: d.has_key?('Walletd') ? d.fetch("Walletd") : nil,
        )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
        "App"  => @App,
        "Peer"  => @Peer,
        "Log"  => @Log,
        "Wallet"  => @Wallet,
        "Walletd"  => @Walletd,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end