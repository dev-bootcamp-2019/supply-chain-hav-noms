pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

//Didnt get these tests going. Seems close though. Need to work this shit out.

contract TestSupplyChain {

    uint public initialBalance = 100 ether; // or any other value

    SupplyChain supplyChain; 
    ThrowProxy throwproxy;

    //Item
    uint sku;
    uint price;
    string name;

    function beforeAll() public {
        //setup testItem data
        price = 10;
        name = "Test Item";
    }

    function beforeEach() public {
        //Get reference to SupplyChain contract
        supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
        //Setup this yucky testproxy junk
        throwproxy = new ThrowProxy(address(supplyChain)); 
    }

    // Test for failing conditions in this contracts

    // test that every modifier is working

    // buyItem
/* 
    function testBuyItemWithSufficientAmount() public {
        //Add an item to buy
        supplyChain.addItem(name, price);
        sku = 0;
        //buy the item for correct amount of ether
        //supplyChain.buyItem(sku).value(10);
        supplyChain.call.value(10)(bytes4(keccak256("buyItem(uint)"), sku));
        
        Assert.equal(
            supplyChain.fetchItem.call(sku),
            1,
            'the state of the item should be "Sold", which should be declared second in the State Enum'
        );
    }

    // test for failure if user does not send enough funds
    function testBuyItemWithInsufficientAmountWithProxy() public {
        //Add an item to buy
        supplyChain.addItem(name, price);
        sku = 0;
        //buy the item for less ether than the price
        SupplyChain(address(throwproxy)).buyItem(sku).value(9);
        bool result = throwproxy.execute.gas(400000)(); 
        Assert.isFalse(result, "Should be false because it should revert!");
    }
*/
    // test for purchasing an item that is not for Sale

    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

}

// Proxy contract for testing throws
contract ThrowProxy {
    address public target;
    bytes data;

    constructor (address _target) public {
        target = _target;
    }

    //prime the data using the fallback function.
    function() external {
        data = msg.data;
    }

/*  
   function execute() public returns (bool) {
        return target.call(data);
    } 
*/
}