pragma solidity >=0.7.0 <0.9.0;

contract AddressContract {
    // address used for one account to another account
    // address = account number in the bank
    // smart contract punya address sendiri

    /* ADDRESS OF SENDER SECTION */
    address public caller;

    // Address of sender: 2 kali action, pertama di set, baru di get caller nya
    function getCallerAddress() public returns(address) {
        caller = msg.sender;
        return caller;
    }

    // Address of sender: Lebih ringkas daripada function sebelumnya, langsung set & get.
    function getCallerAddressWithView() public view returns(address caller) {
        caller = msg.sender;
    }

    /* ADDRESS OF SMART CONTRACT SECTION */
    // Address of smart contract. Not sender.
    function getAddressThis() public view returns(address) {
        address myAddress = address(this);
        return myAddress;
    }

    /* TRANSFER & SEND SECTION */

    // Set Saldo
    uint ether1 = 1000000000000000000;
    uint receivedAmount;

    function receiveEther() payable public {
        receivedAmount = msg.value;
    }

    // Address payable, there is 2 type: send and transfer
    function transferEther(address payable _address, uint amount) public {
        _address.transfer(amount * ether1);
    }

    // Send
    function sendFund(address payable _address, uint amount) public returns(bool) {
        _address.send(amount * ether1);
    }
}