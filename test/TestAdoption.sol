pragma solidity ^0.5.0;

// Truffle directory is a global files. (1 & 2)
// A list of assertion to check equality and etc..
import "truffle/Assert.sol";

// Gets the address of the deployed contract.
import "truffle/DeployedAddresses.sol";

// The smart contract we want to test.
import "../contracts/Adoption.sol";



contract TestAdoption {
 // The address of the adoption contract to be tested
 Adoption adoption = Adoption(DeployedAddresses.Adoption());

 // The id of the pet that will be used for testing
 uint expectedPetId = 8;

 //The expected owner of adopted pet is this contract
 address expectedAdopter = address(this);

 // Testing the adopt() function
function testUserCanAdoptPet() public {
  uint returnedId = adoption.adopt(expectedPetId);

  Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
}

// Testing retrieval of a single pet's owner
function testGetAdopterAddressByPetId() public {
  address adopter = adoption.adopters(expectedPetId);

  Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
}

// Testing retrieval of all pet owners
function testGetAdopterAddressByPetIdInArray() public {
  // Store adopters in memory rather than contract's storage
  address[16] memory adopters = adoption.getAdopters();

  Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
}

}