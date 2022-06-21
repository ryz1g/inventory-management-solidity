// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "./factory.sol";

contract warehouse {
    mapping(string => uint32) private inventory;
    Factory[] private factories;

    //Starting with just one factory
    constructor() public {
        factories.push(new Factory());
    }

    // Add a new factory
    function addFactory() public {
        factories.push(new Factory());
    }

    // Function to produce a particular good from a factory
    // To add support for specific goods
    function produceInFactory1(/*string memory _name,*/ uint32 index, uint32 _qty) public {
        factories[index].makeGood1(_qty);
    }

    function produceInFactory2(/*string memory _name,*/ uint32 index, uint32 _qty) public {
        factories[index].makeGood2(_qty);
    }
    
    // Pulls max inventory possible from all the factories
    function pullInventory(string memory _name) public {
        inventory[_name] += inventoryCountPull(_name);
    }

    // Helper function for pullInventory()
    function inventoryCountPull(string memory _name) private returns(uint32) {
        uint32 tot=0;
        for(uint32 i=0;i<factories.length;i++) {
            uint32 tmp = factories[i].accessProducts(_name); 
            tot += tmp;
            factories[i].removeInventory(_name,tmp);
        }
        return tot;
    }

    // Returns the count of an Inventory present in Warehouse
    function inventoryCount(string memory _name) public view returns(uint32){
        // for(uint32 i=0;i<products.length;i++) {
        // }
        return inventory[_name];
    }

    // Sends inventory to a retailer
    function sendToRetail(string memory _name, uint32 _qty) public {
        // peoples.push(People(_fav,_name));
        require(inventory[_name] >= _qty, "Not enough product!");
        inventory[_name] -= _qty;
    }
}
