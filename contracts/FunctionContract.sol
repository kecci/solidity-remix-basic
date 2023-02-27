pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    uint hasil;

    function printHello() public pure returns(string memory) {
        return 'Hello World';
    }

    function tambah(uint a, uint b) public {
        // local
        uint temp = a + b;

        // need to save to local variable first, then we set to global variable
        hasil = temp;
    }

    function getHasil() public view returns(uint) {
        return hasil;
    }
}

contract PayableContract {
    uint receivedAmount;

    // we need to define the function with `payable`
    function savedEther() payable public {
        // we can use `msg.value` from the form input of the deployed contract
        receivedAmount = msg.value;
    }

    function getTotalAmount() public view returns(uint) {
        return receivedAmount;
    }
}

contract OverloadContract {
    // Overload -> namanya bisa sama, tapi parameternya berbeda
    function tambah(uint a, uint b) public pure returns(uint hasil) {
        hasil = a + b;
        // fungsi overload tidak boleh ada return
    }
    function tambah(uint a, uint b, uint c) public pure returns(uint hasil) {
        hasil = a + b + c;
        // fungsi overload tidak boleh ada return
    }
}

// Fallback and receive function
// https://docs.soliditylang.org/en/v0.8.17/contracts.html#fallback-function
// https://docs.soliditylang.org/en/v0.8.17/contracts.html#receive-ether-function
contract FallbackReceiveContract {
    uint x;
    uint y;
    // This function is called for all messages sent to
    // this contract, except plain Ether transfers
    // (there is no other function except the receive function).
    // Any call with non-empty calldata to this contract will execute
    // the fallback function (even if Ether is sent along with the call).
    fallback() external payable { x = 1; y = msg.value; }

    // This function is called for plain Ether transfers, i.e.
    // for every call with empty calldata.
    receive() external payable { x = 2; y = msg.value; }
}