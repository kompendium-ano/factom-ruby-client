require_relative './lib/FactomWalletd/Compose'
require_relative './lib/FactomWalletd/WalletAddresses'
require_relative './lib/FactomWalletd/WalletTransactions'
require_relative './lib/FactomWalletd/WalletOthers'
require_relative './lib/FactomWalletd/Wallet'

compose = Compose.new

# composeChain
# puts(compose.composeChain("EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r","harry"))

# composeEntry
# puts(compose.composeEntry("48e0c94d00bf14d89ab10044075a370e1f55bcb28b2ff16206d865e192827645","EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r"))

# composeTransaction
# puts(compose.composeTransaction("test1"))


address = WalletAddress.new
# generate ec address
# puts(address.generateEcAddress)

# generate factoid address
# puts(address.generateFactoidAddress)

# import private key
# result = address.importPrivateKey "Es3tXbGBVKZDhUWzDKzQtg4rcpmmHPXAY9vxSM2JddwJSD5td3f8"
# puts result

# importKoinify
# result = address.importKoinify "yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow"
# puts result

# address
# result = address.address "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"
# puts result

# allAddresses
# result = address.allAddresses
# puts result

txn = WalletTransaction.new

# delete transaction
# puts(txn.deleteTransaction( "test1"))

# sub-fee
# puts(txn.subFee( "test1", "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"))

# sign-transaction
# puts(txn.signTransaction( "test1"))

# tmp-transaction
# puts(txn.tmpTransactions)

# transactionsByRange
# puts(txn.transactionsByRange(1, 10))

# transactionsByTxid
# puts(txn.transactionsByTxid("914333898b4cd3a87091ced94d6276090a1a266e1f4b7578e2b036cfaf9aaf3e"))

# transactionsByAddress
# puts(txn.transactionsByAddress("FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"))

# all transactions
# puts(txn.allTransactions)

oth = WalletOthers.new

# get height
# puts(oth.getHeight)

# get properties
# puts(oth.properties)

wallet = Wallet.new

# wallet-backup
# puts(wallet.walletBackup)

# wallet-balances
# puts(wallet.walletBalances)

# Errors
puts(wallet.errors("bad")) # expected response - {"jsonrpc"=>"2.0", "id"=>0, "error"=>{"code"=>-32601, "message"=>"Method not found"}}