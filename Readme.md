# Earth Dollar

The Earth Dollar is a cryptocurrency based on Ethereum.
It derives its value from monetizing untapped resources, and in protecting Mother Earth. The Earth Dollar derives its value from wildlife sanctuaries setup as Global Commons, where the people of the world will collectively engage in protecting the wildlife sanctuaries, known as World Heritage Sanctuaries.

It is still under heavy development.

A pre-alpha version of the main contract storing the wallets is deployed to the
Frontier Ethereum blockchain at **address: 0x449c5b639e9852ada644ffaacfe325dfce6e6e0a**.

## Usage

In order to send transactions to the contract, the ABI and it's address is needed.
The current pre-alpha's ABI is:
`[{"constant":false,"inputs":[{"name":"minterToRemove","type":"address"}],"name":"removeMinter","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"_value","type":"uint256"},{"name":"_to","type":"address"}],"name":"mintCoin","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"index","type":"uint256"}],"name":"minterAt","outputs":[{"name":"","type":"address"}],"type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_value","type":"uint256"},{"name":"_to","type":"address"}],"name":"sendCoinFrom","outputs":[{"name":"_success","type":"bool"}],"type":"function"},{"constant":false,"inputs":[{"name":"newMinter","type":"address"}],"name":"addMinter","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"changeOwner","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"_addr","type":"address"}],"name":"coinBalanceOf","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[{"name":"_value","type":"uint256"},{"name":"_to","type":"address"}],"name":"sendCoin","outputs":[{"name":"_success","type":"bool"}],"type":"function"},{"constant":true,"inputs":[],"name":"coinBalance","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"numMinters","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"inputs":[],"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"sender","type":"address"},{"indexed":false,"name":"receiver","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"CoinTransfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"receiver","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"CoinMinted","type":"event"}]`

To instantiate an proxy object to talk to the contract from within your geth console
issue the following command:

`var EarthDollar = web3.eth.contract([{"constant":false,"inputs":[{"name":"minterToRemove","type":"address"}],"name":"removeMinter","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"_value","type":"uint256"},{"name":"_to","type":"address"}],"name":"mintCoin","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"index","type":"uint256"}],"name":"minterAt","outputs":[{"name":"","type":"address"}],"type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_value","type":"uint256"},{"name":"_to","type":"address"}],"name":"sendCoinFrom","outputs":[{"name":"_success","type":"bool"}],"type":"function"},{"constant":false,"inputs":[{"name":"newMinter","type":"address"}],"name":"addMinter","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"changeOwner","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"_addr","type":"address"}],"name":"coinBalanceOf","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[{"name":"_value","type":"uint256"},{"name":"_to","type":"address"}],"name":"sendCoin","outputs":[{"name":"_success","type":"bool"}],"type":"function"},{"constant":true,"inputs":[],"name":"coinBalance","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"numMinters","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"inputs":[],"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"sender","type":"address"},{"indexed":false,"name":"receiver","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"CoinTransfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"receiver","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"CoinMinted","type":"event"}]).at('0x449c5b639e9852ada644ffaacfe325dfce6e6e0a');`

You should then be able to check your EarthDollar balance with
`EarthDollar.coinBalance.call()`

and send Earth Dollars with

`EarthDollar.sendCoin(<amount>, <receiver_address>, {from: eth.account[0], gas: 50000});`

## Demonminations

#1 earth dollar
#1 ED =10 Dimes
-1 ED = 20 Nickles
-1 ED = 100 Pennies
-1 ED = 1000 Kam 
-1 ED = 10^4 Tilly
-1 ED = 10^5 Fish
-1 ED = 10^5 Rajpal
-1 ED = 10^6 Ratt
-1 ED = 10^7 Wawatie
-1 ED = 10^8 Chief
-1 ED = 10^9 Luck
-1 ED = 10^10 Jack
...
-1 ED = 10^18 Tree


## Developing

This code makes use of the [embark framework](https://github.com/iurimatias/embark-framework). Embark handles creation of a local test blockchain, deployment of the contract code to this blockchain and running a node server with the web part of the Dapp.

In order to run the code locally, change to the apps root directory and issue
`embark blockchain`
and in another window
`embark run`.

To have enough Ether in this test blockchain for deploying and using the contract, change the address in the 'alloc' object within config/genesis/dev_genesis.json.
