pragma solidity >=0.7.0 <0.9.0;

contract Parent {
    uint private data;
    
    uint public info;

    // initialization (dijalankan pertamakali)
    constructor() {
        info = 10;
    }

    function increment(uint a) private pure returns (uint) {
        return a + 1;
    }

    function setIncrement() public pure returns (uint) {
        // bisa menggunakan private function, karena dalam 1 contract.
        return increment(2);
    }

    // public
    function updateData(uint a) public {data = a;}
    function getData() public view returns (uint) { return data; }
    function compute(uint a, uint b) internal pure returns (uint) {return a + b;}
}

contract ExternalContract {
    function readData() public returns (uint) {
        Parent c = new Parent();
        c.updateData(7);
        return c.getData();
    }
}

contract NewContract is Parent {
    uint private result;
    Parent private c;

    constructor() {
        c = new Parent();
    }

    function getComputeResult() public {
        result = compute(3, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function getInfo() public view returns(uint) {
        return c.info();
    }
}