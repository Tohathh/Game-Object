pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "interfaceGameObject.sol";
import "gameObject.sol";
import "baseStation.sol";
import "militaryUnit.sol";

contract warrior is militaryUnit {
    
    paramUnit unit = paramUnit(50, 500); // создаем экземпляр юнита с параметрами атаки и защиты
 
}