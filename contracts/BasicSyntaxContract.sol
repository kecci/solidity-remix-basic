pragma solidity >=0.7.0 <0.9.0;

contract BasicSyntaxContract {
    uint storedData;
    
    // set storedData   
    function set(uint x) public {
        storedData = x;
    }
    
    // get storedData
    function get() public view returns (uint) {
        return storedData;
    }
}