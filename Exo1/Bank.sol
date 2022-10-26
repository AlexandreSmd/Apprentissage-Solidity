// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract Bank{
    uint256 fondsTotaux = 0;
    
    //recupFondsTotaux : sert à avoir le montant d'ether stocker dans le smart contract (banque).
    function recupFondsTotaux() public view returns(uint) {
        return fondsTotaux;
    }

    mapping(address => uint) fonds;
    
    //ajoutFonds : sert pour un utilisateur à ajouter des fonds dans la banque
    function ajoutFonds() public payable {
        fonds[msg.sender] = fonds[msg.sender] + msg.value;
        fondsTotaux = fondsTotaux + msg.value;
    }
    
    //recupUserBalance : donne la balance d'un utilisateur de la banque
    function recupUserBalance(address userAddress) public view returns(uint){
        uint _value = fonds[userAddress];
        return _value;
    }
    
    //retireFonds : sert à retirer les fonds de la banque pour un utilisateur donné
    function retireFonds() public payable {
        address payable retireVers = payable(msg.sender);
        uint montant = recupUserBalance(msg.sender);
        retireVers.transfer(montant);
        fondsTotaux = fondsTotaux - montant;
        fonds[msg.sender] = 0;
    }
}
