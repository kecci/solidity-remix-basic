pragma solidity >=0.7.0 <0.9.0;

// Variable
contract VariableTypes {
    // state variable private
    uint sum;

    // local variable
    function tambah(uint num1, uint num2) public {
        // local
        uint temp = num1 + num2;

        sum = temp;
    }

    function getHasil() public view returns (uint) {
        return sum;
    }
}

// Type
contract Types {
    bool public valid = true;
    
    int32 public data_int32 = -32;
    uint public data_uint = 1;
    
    uint32 public ui_data = 27_02_2023;

    uint8 result;

    function tambah() public {
        // result = 3 / 5; // tidak bisa karena hasil-nya bukan uint8 tapi float
        result = 3.5 + 1.5; // bisa karena hasil-nya akan menjadi unit8
    }

    // bytes 1-32 (jika datanya tetap)
    bytes1 public huruf = "A";
    string public kalimat = "ini adalah data string";
}

// Enum
contract MyEnum {
    enum Days {Mon, Tue, Wed, Thur, Fri, Sat, Sun}
    
    enum Jobs {Programmer, Analysis, Security}

    function getEnumDays() public pure returns (Days) {
        return Days.Mon;
    }
}
