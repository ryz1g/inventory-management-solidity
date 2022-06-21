// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract rawMaterials {
    /*uint256 f1 = 5 ;
    bool f2 = false;
    string f3 = "String";
    int256 f4 = -5;
    address f5 = 0x7e100D045F729227221273F958bB53bc5CFD85a5;
    bytes32 f6 = "cat";*/

    // struct People {
       // uint256 fav;
       //  string name;
    // }

    // People public person = People({fav: 2, name: "Patrick"});

    // People[] public peoples;
    mapping(string => uint32) public materialCount;

    constructor() public {
        materialCount["wood"] = 100;
        materialCount["steel"] = 60;
        materialCount["rubber"] = 80;
    }

    /*
    function store(uint256 _favorite)  public {
        fav = _favorite;
    }

    function retrieve() public view returns(uint256) {
        return fav;
    }*/

    function addRawMaterial(string memory _name, uint32 _qty) public {
        // peoples.push(People(_fav,_name));
        materialCount[_name] += _qty;
    }

    function removeRawMaterial(string memory _name, uint32 _qty) public {
        // peoples.push(People(_fav,_name));
        require(materialCount[_name] >= _qty, "Not enough raw material!");
        materialCount[_name] -= _qty;
    }

    function accessRaw(string memory _name) public view returns(uint32) {
        return materialCount[_name];
    }
}
