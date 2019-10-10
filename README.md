# factom-ruby

# Example 
[
    # add class refrence 

    require_relative './lib/FactomAddress'
    require_relative './lib/ImportAddress'
    require_relative './lib/FactomBalance'
    require_relative './lib/CreateFactomChain'
    require_relative './lib/ReadFactomChain'
    require_relative './lib/Transaction'

    # generate ec address
    address = FactomAddress.new
    puts(address.generateEcAddress)
    puts(address.generateFactoidAddress)

    # import private key
    import = ImportAddress.new
    result = import.importPrivateKey "Es3tXbGBVKZDhUWzDKzQtg4rcpmmHPXAY9vxSM2JddwJSD5td3f8"
    puts result

    # get ec address balance
    balance = FactomBalance.new
    result = balance.getECAddressBalance "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH"
    puts result


    # get factoid address balance
    result = balance.getFactoidAddressBalance "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"
    puts result


    # create a factom chain
    crChain = CreateFactomChain.new
    rs = crChain.createFactomChain "EC2VKr9Vm5yuWtT9DMfnyPUDZkJH6oiNBipbtjA3YLWkenW9P1qm", "harishankar joshi"
    puts rs

    # Make a Factom Entry
    rs = crChain.makeFactomEntry "fc66c38089454fdfb2e4e51835988592db6294d167d53d5f5a7b13944e3644c9", "EC2VKr9Vm5yuWtT9DMfnyPUDZkJH6oiNBipbtjA3YLWkenW9P1qm"
    puts rs

    # Read Factom Entry
    rdChain = ReadFactomChain.new
    rs = rdChain.readChainEntry "b11bb4e1dacea726224c05bf863092ba02d301de55c08039f381e6e0ad1cef0d"
    puts rs

    # send transaction
    txn = Transaction.new
    data = [
        "txname" => "test1",
        "inputAddress" => "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q",
        "inputAmount" => 1000012000,
        "outputAddress" => "FA2yeHMMJR6rpjRYGe3Q4ogThHUmByk3WLhTjQDvPrxDoTYF8BbC",
        "outputAmount" => 1000000000
    ]
    rs = txn.sendTransaction data
    puts rs
}