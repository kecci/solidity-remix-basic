pragma solidity >=0.7.0 <0.9.0;

// location data
// gas

// Ada 4 tipe penyimpanan smart contract:
// 1. storage: lokasi penyimpanan sifatnya permanen (disemua fungsi). seperti hardisk. state variable. gas lebih besar.
// 2. memory: gas lebih kecil. hanya bisa di akses di fungsi saja. seperti ram.
// 3. calldata: lokasi tidak dapat di modification, lalu sifatnya tidak persistent / tetap, lokasi default parameternya.
// 4. stack: data sifat nya non-persistent, mirip calldata. dikelola langsung oleh vm ethereum. menggunakan lokasi data stack tersebut untuk variable selama ada eksekusi. sampai 1024 level.

contract ExampleLocation {
    /* Storage & Memory - Example 1 */
    // storage
    uint stateStorage;
    // uint storage myStorage; // akan error, tidak perlu di declare storage nya

    // memory: a, b, result
    function kalkulasi(uint a, uint b) public pure returns(uint result) {
        return a + b;
    }

    /* Storage & Memory - Example 2 */
    // storage
    bool isReady; // storage
    string name; // storage

    function iniFungsi() public {
        // values 
        bool isOk; // memory
        uint number; // memory
        address account; // memory
    }
}

// State variable storage
contract UpdatePublicStorageLocation {
    uint public stateVariable1 = 10;
    uint stateVariable2 = 20;

    function iniFungsi() public returns(uint) {
        stateVariable1 = stateVariable2;
        stateVariable2 = 30;
        return stateVariable1;
    }
}

// State variable memory
contract UpdateStorageLocation {
    uint stateVar = 10;

    function iniFungsi() public returns (uint) {
        uint localVariable = 20; // memory
        stateVar = localVariable;

        localVariable = 40; // tidak bisa mengubah yang stateVar

        return stateVar; // 20, bukan 40.
    }
}

contract UpdateMemoryLocation {
    uint stateVar = 10;
    
    function iniFungsi() public returns (uint) {
        uint localVar = 20; // memory
        localVar = stateVar;

        stateVar = 40; // tidak berpengaruh yang mengubah localVar

        return localVar; // 10, bukan 40.
    }
}

contract ArrayLocation {
    function iniFungsi() public pure returns (uint[] memory, uint[] memory) {
        uint[] memory localMemoryArray1 = new uint[](3);

        localMemoryArray1[0] = 1;
        localMemoryArray1[1] = 2;
        localMemoryArray1[2] = 3;

        uint[] memory localMemoryArray2 = localMemoryArray1; // reference, bisa reflection
        localMemoryArray1[0] = 10; // berpengaruh pada memory1 & memory2 (karena reference)

        return (localMemoryArray1, localMemoryArray2); // isinya sama (10, 2, 3) & (10, 2, 3)
    }

    function iniValue() public pure returns (uint) {
        uint localVar1 = 10;
        uint localVar2 = 20;

        localVar1 = localVar2; // copy, bukan reference, tidak reflection
        localVar1 = 40; 

        return localVar1; // 40
    }
}