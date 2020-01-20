require_relative '../lib/FactomWalletd//Compose'
require_relative '../lib/FactomWalletd/WalletAddresses'
require_relative '../lib/FactomWalletd/WalletTransactions'
require_relative '../lib/FactomWalletd/WalletOthers'
require_relative '../lib/FactomWalletd/Wallet'
require_relative '../lib/config'
config=Config.new
# config.setHost("http://abc.com")
# config.setPort(8000)
# config.setWalletdPort(8009)

# compose = Compose.new(config)
#
# # composeChain
# puts(compose.composeChain("EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r","harry"))
#
# # composeEntry
# puts(compose.composeEntry("48e0c94d00bf14d89ab10044075a370e1f55bcb28b2ff16206d865e192827645","EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r"))
#
# # composeTransaction
# puts(compose.composeTransaction("test1"))
#
# # composeIdentityAttribute
# puts(compose.composeIdentityAttribute("3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae",
#                                       "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae",
#                                       [{"key":"email","value":"hello@factom.com"}],
#                                       "idpub2cw4NS4JZowXTwhGeo2tTGNvnjc5n2QvHBURdvVFCKRDuLEnBh",
#                                       "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae",
#                                       "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", false))
#
# # composeIdentityAttributeEndorsement
# puts(compose.composeIdentityAttributeEndorsement("3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae",
#                                       "c07f1d89bb6c43e7e3166b9e53672110ff8077c367758fbe4265561c8b91e675",
#                                       "idpub2cw4NS4JZowXTwhGeo2tTGNvnjc5n2QvHBURdvVFCKRDuLEnBh",
#                                       "2321663B3B8A09CB4E701B84DEE49ABCE3C9D3EFDE867A9875E536D5ECEB653C",
#                                       "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", false))
#
# # composeIdentityChain
# puts(compose.composeIdentityChain(["Factom","Test","Identity"],
#                                                  ["idpub2k8zGYQUfekxehyUKeqPw6QPiJ5hkV3bbc9JBgL7GNrEiqMpQX",
#                                                   "idpub3fXRj21gXveTk6RKYrpJniWV2pAanQktekEt62yhJUQXyPdvwL","idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w"],
#                                                  "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", false))
#
# # compose-identity-key-replacement
# puts(compose.composeIdentityKeyReplacement(["Factom","Test","Identity"],
#                                                  "idpub2k8zGYQUfekxehyUKeqPw6QPiJ5hkV3bbc9JBgL7GNrEiqMpQX",
#                                                   "idpub3fXRj21gXveTk6RKYrpJniWV2pAanQktekEt62yhJUQXyPdvwL",
#                                                 "idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w",
#                                                  "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", false))
#
# # composeIdentityKeyReplacement
# puts(compose.composeIdentityKeyReplacement("3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae",
#                                               "idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w",
#                                            "idpub2cw4NS4JZowXTwhGeo2tTGNvnjc5n2QvHBURdvVFCKRDuLEnBh",
#                                            "idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w",
#                                            "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4",false))
#
# address = WalletAddress.new(config)
# # generate ec address
# puts(address.generateEcAddress.public)
#
# # generate factoid address
# puts(address.generateFactoidAddress.public)
#
# # import private key
# result = address.importPrivateKey "Es3tXbGBVKZDhUWzDKzQtg4rcpmmHPXAY9vxSM2JddwJSD5td3f8"
# puts result.addresses
#
# # importKoinify
# result = address.importKoinify "yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow"
# puts result.public
#
# # address
# result = address.address "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"
# puts result.public
#
# # allAddresses
# result = address.allAddresses
# puts result.addresses
#
# # generateIdentityKey
# result = address.generateIdentityKey
# puts result.public
#
# # importIdentityKeys
# result = address.importIdentityKeys("idsec2rWrfNTD1x9HPPesA3fz8dmMNZdjmSBULHx8VTXE1J4D9icmAK","idsec1iuqCFoiEfSZ1rU2FNpa7oFY3Kc29hHxP1R2PDyacJQEA8iShB")
# puts result.keys
#
# # removeAddress
# result = address.removeAddress("EC3Pa3auBtWKwfkDT5VF2obEoioAJ8pTvftyQ3trURzWJfaAdUXc")
# puts result.success
#
# # removeIdentityKey
# result = address.removeIdentityKey("idpub26PEBWuumVp19yUSpfGJ2HPrTrU7hgw5empU7FPiTHdCKoy5Ao")
# puts result.success
#
# txn = WalletTransaction.new(config)
#
# # delete transaction
# puts(txn.deleteTransaction( "test1"))
#
# # sub-fee
# puts(txn.subFee( "test1", "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"))
#
# # sign-transaction
# puts(txn.signTransaction( "test1"))
#
# # tmp-transaction
# puts(txn.tmpTransactions)
#
# # transactionsByRange
# puts(txn.transactionsByRange(1, 10))
#
# # transactionsByTxid
# puts(txn.transactionsByTxid("914333898b4cd3a87091ced94d6276090a1a266e1f4b7578e2b036cfaf9aaf3e"))
#
# # transactionsByAddress
# puts(txn.transactionsByAddress("FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q"))
#
# # all transactions
# puts(txn.allTransactions)
#
#
# # all transactions
# puts(txn.signData("FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q","ZmFjdG9tIGlzIGdyZWF0"))
#
# oth = WalletOthers.new(config)
#
# # get height
# puts(oth.getHeight.height)
#
# # get properties
# puts(oth.properties.walletversion)
#
# wallet = Wallet.new(config)
#
# # wallet-backup
# puts(wallet.walletBackup.wallet_seed)
#
# # wallet-balances
# puts(wallet.walletBalances.fctaccountbalances)
#
# # unlockWallet
# puts(wallet.unlockWallet("opensesame","300").unlockeduntil)
#
# # Errors
# puts(wallet.errors("bad")) # expected response - {"jsonrpc"=>"2.0", "id"=>0, "error"=>{"code"=>-32601, "message"=>"Method not found"}}
# #
#
# # active-identity-keys
# puts(oth.activeIdentityKeys("3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", "163419").chainid)
# #
#
# # active-identity-keys
# puts(oth.allIdentityKeys.keys)