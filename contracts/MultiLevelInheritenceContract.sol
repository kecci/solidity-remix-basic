pragma solidity >=0.7.0 <0.9.0;

contract A {
    function getAValue() external pure returns (string memory) {
        return "Contract A Called";
    }
}

contract B is A {
    function getBValue() external pure returns (string memory) {
        return "Contract B Called";
    }
}

contract C is B{
    function getCValue() external pure returns (string memory) {
        return "Contract C Called";
    }
}

contract caller {
    C contractC = new C();

    function warisan() public view returns (string memory, string memory, string memory) {
        return (contractC.getAValue(), contractC.getBValue(), contractC.getCValue());
    }
}