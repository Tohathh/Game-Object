pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "interfaceGameObject.sol";
import "gameObject.sol";
import "baseStation.sol";
import "militaryUnit.sol";

contract archer is militaryUnit {
    
    paramUnit unit = paramUnit(40, 250); // создаем экземпляр юнита с параметрами атаки и защиты
 
}