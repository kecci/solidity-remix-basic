pragma solidity >=0.7.0 <0.9.0;

contract A {
    uint internal a;

    function getA(uint _value) external {
        a = _value;
    }
}

contract B {
    uint internal b;

    function getB(uint _value) external {
        b = _value;
    }
}

contract C is A,B {
    function getValueOfSum() external view returns (uint) {
        return a + b;
    }
}

contract caller {
    C contractC = new C();

    function warisan() public returns (uint) {
        contractC.getA(10);
        contractC.getB(20);

        return contractC.getValueOfSum();
    }
}