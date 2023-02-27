pragma solidity >=0.7.0 <0.9.0;

contract Parent {
    uint internal id;

    function setValue(uint _value) external {
        id = _value;
    }
}

contract Andi is Parent {
    function getValue() external view returns (uint) {
        return id;
    }
}

contract InheritenceContrat {
    Andi andika = new Andi();

    function wariskan(uint _input) public returns (uint) {
        andika.setValue(_input);
        return andika.getValue();
    }
}