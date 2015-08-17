contract EarthDollarWallets{
  mapping (address => uint) balanceOf;
  address[] minters;
  address owner;

  modifier only_owner { if (msg.sender == owner) _ }
  modifier only_minter { 
    for(uint i=0; i<minters.length; i++)
      if (msg.sender == minters[i]) _ 
  }

  event CoinTransfer(address sender, address receiver, uint amount);
  event CoinMinted(address receiver, uint amount);


  function EarthDollarWallets() {
    minters.length = 1;
    minters[0] = msg.sender;
    owner = msg.sender;
  }

  function changeOwner(address newOwner) only_owner {
    owner = newOwner;
  }

  function addMinter(address newMinter) only_owner {
    minters[minters.length++] = newMinter;
  }

  function removeMinter(address minterToRemove) only_owner {
    bool found = false;
    for(uint i=0; i<minters.length; i++){
      if(minters[i] == minterToRemove){
        found = true;
      }
      if(found){
        if(i<minters.length-1){
          minters[i] = minters[i+1];
        }  
      }
    }
    if(found){
      minters.length--;  
    }
  }

  function numMinters() constant only_owner returns(uint) {
    return minters.length;
  }

  function minterAt(uint index) constant only_owner returns(address) {
    return minters[index];
  }


  function coinBalance() constant returns(uint){
    return balanceOf[msg.sender];
  }

  function coinBalanceOf(address _addr) only_minter returns(uint) {
    return balanceOf[_addr];
  }

  function sendCoin(uint _value, address _to) returns(bool _success) {
    if (balanceOf[msg.sender] < _value) return false;
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    CoinTransfer(msg.sender, _to, _value);
    return true;
  }

  function sendCoinFrom(address _from, uint _value, address _to) returns(bool _success) {
    return false;
  }

  function mintCoin(uint _value, address _to) only_minter {
    balanceOf[_to] += _value;
    CoinMinted(_to, _value);
  }




}