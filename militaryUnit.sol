pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "interfaceGameObject.sol";
import "gameObject.sol";
import "baseStation.sol";

contract militaryUnit is gameObject {
    
    address public addressBase;

    //структура параметров атаки и защиты юнитов
    struct paramUnit {
        uint attack;
        uint defence;
    }
    paramUnit public unit; //переменная типа структуры
    
    //конструктор , принимает baseStation, unit
    constructor (baseStation base, uint unit) public { 
        base.creatUnit(unit); //метод добавления военного юнита
        addressBase = msg.sender; //сохранение адреса baseStation
    }

    //функция принимает интерфейс, его адрес
    function attackUnit(interfaceGameObject attack, uint strengthAttack)  public {
            tvm.accept();
            attack.acceptAttack(strengthAttack);
    }
}