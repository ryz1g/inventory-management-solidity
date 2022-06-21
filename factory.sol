// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "./raw.sol";

contract Factory is rawMaterials{
    // mapping(string => uint32) public materialCount;
    // rawMaterials rm = new rawMaterials();
    // constructor
    // constructor() public {
    //      rm = new rawMaterials();
    // }
    //Takes 5 wood and 2 steel to make hammer
    mapping(string => uint32) public prodQuant;
    string[] products;
    

    constructor() public {
        // combs.push(Combination("hammer",["wood","steel"],[5,2]));
        products.push("hammer");
        products.push("tyre");
    }

    function makeGood1(uint32 _qty) public {
        // rawMaterials rr = rawMaterials(address(rm));
        require(accessRaw("wood") >= _qty*5 ,"Not enough wood!");
        require(accessRaw("steel") >=_qt
        y*2, "Not enought steel!");
        prodQuant["hammer"] += _qty;
        removeRawMaterial("wood",_qty*5);
        removeRawMaterial("steel",_qty*2);
    }

    //Takes 2 steel and 3 rubber to make tyre
    function makeGood2(uint32 _qty) public {
        // rawMaterials rr = rawMaterials(address(rm));
        require(accessRaw("steel") >=_qty*2, "Not enought steel!");
        require(accessRaw("wood") >= _qty*3 ,"Not enough rubber!");
        prodQuant["tyre"] += _qty;
        removeRawMaterial("rubber",_qty*3);
        removeRawMaterial("steel",_qty*2);
    }

    function accessProducts(string memory _name) public view returns(uint32) {
        return prodQuant[_name];
    }

    function removeInventory(string memory _name,uint32 _qty) public{
        prodQuant[_name] -= _qty;
    }
    // function addProduct() {
        
    // }
}
