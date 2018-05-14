//
//  BrainCalculator.swift
//  My First Calculator Project
//
//  Created by Hamada Mouhamed on 1/3/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import Foundation

class BrainCalculator {
    //10 + 100  - 10
    func Restart(){
        NumWithOpArray = []
    }
    func Add(Number : Double , With Operation : Character){
        NumWithOpArray.append(CalcElement(Num : Number , Op : Operation))
    }
    func Result() -> String{
        CalcMultiplyAndDividedBy()
        AllMinus()
        return String(NumWithOpArray.reduce(0, {$0+$1.Num}))
    }
    typealias CalcElement = (Num:Double,Op:Character)
    private var NumWithOpArray : [CalcElement] = []
    func CalcMultiplyAndDividedBy() {
        for (index,current) in NumWithOpArray.enumerated() {
            if current.Op == "X" || current.Op == "/"{
            let afterCurrent = NumWithOpArray[index+1]
            var NewCalc : CalcElement!
                if current.Op == "X"{
                    NewCalc = CalcElement(Num: current.Num * afterCurrent.Num , Op: afterCurrent.Op)
                }else if current.Op == "/"{
                    NewCalc = CalcElement(Num: current.Num / afterCurrent.Num , Op: afterCurrent.Op)
                }
                NumWithOpArray.remove(at: index) ; NumWithOpArray.remove(at: index)
                NumWithOpArray.insert(NewCalc, at: index)
                CalcMultiplyAndDividedBy()
                break
}
}
}
    
    func AllMinus(){
        for (index,current) in NumWithOpArray.enumerated() {
            if current.Op == "-" {
                let afterCurrent = NumWithOpArray[index+1]
                NumWithOpArray.remove(at: index) ; NumWithOpArray.remove(at: index)
            NumWithOpArray.insert(CalcElement(Num: current.Num - afterCurrent.Num , Op : "+"), at: index)
                AllMinus()
                break
    }
}
}
}
