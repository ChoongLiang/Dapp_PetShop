pragma solidity ^0.5.0;

contract Adoption {

 // Var adopters, an array of ethereum address,len=16
 address[16] public adopters;


 // Adopting a pet
function adopt(uint petId) public returns (uint) {
  require(petId >= 0 && petId <= 15);

  adopters[petId] = msg.sender;

  return petId;
}

// Retrieving the adopters
// Memory gives the data location for the variable.
// View = only view, will not modify
function getAdopters() public view returns (address[16] memory) {
  return adopters;
}

}