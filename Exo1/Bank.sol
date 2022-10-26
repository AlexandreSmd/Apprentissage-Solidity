// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract Bank{
    uint256 fondsTotaux = 0;

    function recupFondsTotaux() public view returns(uint) {
        return fondsTotaux;
    }

    mapping(address => uint) fonds;

    function ajoutFonds() public payable {
        fonds[msg.sender] = fonds[msg.sender] + msg.value;
        fondsTotaux = fondsTotaux + msg.value;
    }

    function recupUserBalance(address userAddress) public view returns(uint){
        uint _value = fonds[userAddress];
        return _value;
    }
    
    function retireFonds() public payable {
        address payable retireVers = payable(msg.sender);
        uint montant = recupUserBalance(msg.sender);
        retireVers.transfer(montant);
        fondsTotaux = fondsTotaux - montant;
        fonds[msg.sender] = 0;
    }
}