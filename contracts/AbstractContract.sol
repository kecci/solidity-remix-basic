pragma solidity >=0.7.0 <0.9.0;

abstract contract AbstractContract {
    function getAngka(uint a, uint b) public virtual;

    function hitung() public virtual view returns (uint);
}

contract Hitung is AbstractContract {
    uint panjang;
    uint lebar;

    function getAngka(uint a, uint b) public override {
        panjang = a;
        lebar = b;
    }

    function hitung() public override view returns (uint) {
        return panjang * lebar;
    }   
}