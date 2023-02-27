pragma solidity >=0.7.0 <0.9.0;

contract PayableContract {
    address payable public owner;
    
    constructor() payable {
        owner = payable(msg.sender);
    }

    // payable: artinya bisa kirim ether dan menerima ether
    function deposit() public payable {

    }

    function getAmount() public view returns (uint) {
        uint amount = address(this).balance;
        return amount;
    }

    function withdraw() public {
        uint amount = address(this).balance;
        (bool success,) = owner.call{value : amount}("");
        require(success, "Failed to withdraw ");
    }

    function transfer(address payable _to, uint _amount) public {
        (bool success,) = _to.call{value : _amount}("");
        require(success, "Failed kirim ether to owner");
    }  
}