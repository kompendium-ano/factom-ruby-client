class Config
  def initialize
    @h="http://localhost"
    @port=8088
    @walletPort=8089
  end
  def getHost
    return @h
  end

  def getPort
    return @port
  end

  def getWalletdPort
    return @walletPort
  end

  def setHost(host)
    @h=host
    return @h
  end

  def setPort(port)
    @port=port
    return @port
  end

  def setWalletdPort(port)
    @walletPort=port
    return @walletPort
  end
end