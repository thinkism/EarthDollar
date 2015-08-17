contract EarthDollar {
    struct Certificate {
      address owner;
      uint value;
      uint serial;
      uint lastPayout;
    }

    address public minter;
    mapping (address => uint) public dollarBalanceOf;
    uint public numCertificates;
    mapping (uint => Certificate) public certificates;

    modifier onlyminter { if (msg.sender == minter) _ }

    event CoinTransfer(address sender, address receiver, uint amount);
    event CertificateTransfer(address sender, address receiver, uint serial);

    function EarthDollar() {
        minter = msg.sender;
    }

    function setMinter(address m) onlyminter returns(bool success){
        minter = m;
    }

    function getMinter() returns(address){
        return minter;
    }

    function createCertificate(address receiver, uint value, uint serial) onlyminter {
        
        certificates[numCertificates-1] = Certificate({owner: receiver, value: value, serial: serial, lastPayout: now});
        numCertificates++;
    }

    function totalNumberOfCertificates() onlyminter returns(uint){
        return numCertificates;
    }

    function numberCertificatesForOwner(address owner) returns(uint) {
        uint number=0;
        for(uint i=0; i < numCertificates; i++){
            if(certificates[i].owner == owner){
                number++;
            }
        }
        return number;
    }

    function getCertificateValueForOwner(address owner, uint index) returns(uint){
        uint number=0;
        for(uint i=0; i < numCertificates; i++){
            if(certificates[i].owner == owner){
                if(number == index) return certificates[i].value;
                else number++;
            }
        }
        return 0;
    }

    function getCertificateSerialForOwner(address owner, uint index) returns(uint){
        uint number=0;
        for(uint i=0; i < numCertificates; i++){
            if(certificates[i].owner == owner){
                if(number == index) return certificates[i].serial;
                else number++;
            }
        }
        return 0;
    }

    function mintDollar(address receiver, uint value) onlyminter returns(bool success){
        dollarBalanceOf[receiver] += value;
    }

    function doInterestsPayouts() onlyminter returns(bool success){
        for(uint i=0; i < numCertificates; i++){
            address certificateOwner = certificates[i].owner;
            dollarBalanceOf[certificateOwner] += certificates[i].value * 271828 / 10000000;
        }
    }

    function sendDollar(address receiver, uint amount) returns(bool sufficient) {
        if (dollarBalanceOf[msg.sender] < amount) return false;
        dollarBalanceOf[msg.sender] -= amount;
        dollarBalanceOf[receiver] += amount;
        CoinTransfer(msg.sender, receiver, amount);
        return true;
    }

    function transferCertificate(address receiver, uint serial) returns(bool success){
        for(uint i=0; i < numCertificates; i++){
            if(certificates[i].owner == msg.sender && certificates[i].serial == serial){
                certificates[i].owner = receiver;
                CertificateTransfer(msg.sender, receiver, serial);
            }
        }
        return false;
    }

    function getBalance() returns(uint balanace){
        return dollarBalanceOf[msg.sender];
    }
}
