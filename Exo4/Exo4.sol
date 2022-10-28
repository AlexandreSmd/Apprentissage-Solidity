// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Exo4 {

    uint fondTotaux;

    struct Wallet {
        uint balance;
        uint NumeroTransfert; 
    }

    mapping (address => Wallet) wallet;

    function GetTotalBalance() view public returns(uint) {
        return fondTotaux;
    }

    function Add() public payable {
        Wallet storage MyWallet;
        MyWallet = wallet[msg.sender];
        MyWallet.balance = MyWallet.balance + msg.value;
        fondTotaux = fondTotaux + msg.value;
    }

    function GetMyBalance() view public returns(uint) {
        Wallet storage MyWallet = wallet[msg.sender];
        return MyWallet.balance;
    }

    function WithDraw(uint money) payable public {
        Wallet storage MyWallet = wallet[msg.sender];
        require(MyWallet.balance >= money, 'not enough money');
        address payable WithDrawAddress = payable(msg.sender);
        WithDrawAddress.transfer(money);
        fondTotaux = fondTotaux - money;
        MyWallet.balance = MyWallet.balance - money;
        MyWallet.NumeroTransfert++;
    }

    function Transfer(uint money, address _to) external {
        Wallet storage MyWallet = wallet[msg.sender];
        Wallet storage OtherWallet = wallet[_to];
        require(MyWallet.balance >= money);
        MyWallet.balance = MyWallet.balance - money;
        OtherWallet.balance = OtherWallet.balance + money;
    }

}

