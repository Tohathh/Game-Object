
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "interfaceGameObject.sol";

contract gameObject is interfaceGameObject {
    
    uint public strengthDef;
    address public callerAddress;

    //функция атаки 
    function acceptAttack(uint strengthAttack) virtual external override { //external - данный метод можно вызывать только из вне
        tvm.accept(); //подтверждение оплаты
        // если сила атаки больше уровня защиты, приравниваем силу атаки к защите(иначе будет отрицательное значение)
        if(strengthAttack > strengthDef){ 
            strengthAttack = strengthDef;
        }
        uint strengthDefMin = strengthDef - strengthAttack; //остаток уровня защиты
        strengthDef = strengthDefMin; // новый уровень защиты
        callerAddress = msg.sender; //сохранение адреса, кто вызвал функцию
    }

    //функция проверки, убит ли объект с уничтожением адреса
    function killedObject(uint strengthDefMin, address dest, uint128 value, bool bounce) private { //private - доступен только внутри контракта(класса)
        tvm.accept(); //подтверждение оплаты
        if(strengthDefMin == 0){
            // метод transfer, позволяющий осуществлять передачу, некоторые параметры определены сразу
            callerAddress.transfer(value, bounce, 160);// флаг 128+31=160 - отправить все деньги и уничтожить адрес
        }
    }

}