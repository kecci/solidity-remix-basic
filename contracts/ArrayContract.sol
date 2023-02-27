pragma solidity >=0.7.0 <0.9.0;

// Fixed
contract ArrayContract {

    function getData() public pure returns (uint[5] memory) {
        uint[5] memory data = [uint(50), 60, 70, 80, 100];
        return data;
    }

    function getSingleData() public pure returns (uint) {
        uint[5] memory data = [uint(50), 60, 70, 80, 100];
        return data[1]; // 60, karena index start dari 0.
    }

    uint[5] datas; // state variable, public dan permanent

    function getDataPublic() public returns (uint){
        datas = [uint(50), 60, 70, 80, 100]; // fixed array
        return datas[1];
    }
}

// Dynamic
contract DynaimcArrayContract {
    /* Cara 1: Using inline */
    uint[] data;

    function getData() public returns (uint[] memory) {
        data = [60, 70, 30, 40];
        return data;
    }

    /* Cara 2: Using new empty */
    uint[] dataNew;

    function getDataNew() public returns (uint[] memory) {
        dataNew = new uint[](3);
        
        dataNew[0] = 10;
        dataNew[1] = 20;
        dataNew[2] = 30;

        return dataNew;
    }
}

contract ArrayLenghtContract {
    uint[7] data;

    function arrayExample() public payable returns (uint[7] memory) {
        data = [uint(10), 20, 30, 40, 50, 60];
        return data;
    }

    function arrayLength() public returns (uint) {
        uint x = data.length;
        return x;
    }
}

contract PushArrayContract {
    uint[] arr;

    function insert() public returns (uint[] memory) {
        arr = [1, 2, 3];

        //Push array 
        arr.push(4);
        arr.push(5);

        return arr;
    }
}

contract PopArrayContract {
    uint[] arr;

    function pop() public returns (uint[] memory) {
        arr = [1, 2, 3];

        //Push array 
        arr.pop();
        arr.pop();

        return arr;
    }
}