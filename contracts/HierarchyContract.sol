pragma solidity >=0.7.0 <0.9.0;

contract A {
    function getAValue() external pure returns (string memory) {
        return "Contract A Called";
    }
}

contract B is A {

}

contract C is A {

}

contract caller {
    B contractB = new B();
    C contractC = new C();

    function warisan() public view returns (string memory, string memory) {
        return (contractB.getAValue(), contractC.getAValue());
    }
}