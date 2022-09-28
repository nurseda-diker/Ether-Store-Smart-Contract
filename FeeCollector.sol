//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract FeeCollector{
    address public owner; //sözleşme sahibi
    uint256 public balance; //güncel bakiye

    constructor(){
        owner=msg.sender; //constructor çağrıldığında adres(owner)  gönderilecek.
    }

    //para gönderme
    receive() payable external{
        balance += msg.value;
    }

    //parayı geri çekme
    function withdraw(uint256 amount,address payable destAddr) public {
        require(msg.sender==owner,"Only owner can withdraw"); //bu fonksiyon yalnızca sahibi tarafından çağırabilir.
        require(amount <= balance, "Insufficient funds");
        destAddr.transfer(amount);
        balance -= amount;
    }


}
