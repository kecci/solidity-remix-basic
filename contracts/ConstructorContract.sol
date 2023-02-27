pragma solidity >=0.7.0 <0.9.0;

contract ConstructorContract {
    int totalSupply;

    address private owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    constructor(int _totalSupply) public {
        if (owner == msg.sender) {
            totalSupply = _totalSupply;
        }
    }

    function getTotalSupply() public view returns (int) {
        return totalSupply;
    }
}