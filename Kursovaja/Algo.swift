//
//  Algo.swift
//  Kursovaja
//
//  Created by Piter Miller on 17.05.17.
//  Copyright © 2017 Piter Miller. All rights reserved.
//

import Foundation

class Algo {
    
    class func calculate(firstMatrix: MatrixInterface, resultVector: Vector, prescision: Double) {
        let start = CFAbsoluteTimeGetCurrent()
        
        var comutedResultArray: [Double] = resultVector
        var copyComutedResultArray: [Double] = Array<Double>(repeating: 0.0, count: comutedResultArray.count)
        
        
        for u in 0..<100000 {
            for i in 0..<copyComutedResultArray.count {
                copyComutedResultArray[i] = (getSummOfIElement(firstMatrix: firstMatrix, copyComutedResultArray: comutedResultArray, elementIndex: i) + resultVector[i])/(1-firstMatrix[i,i])
            }
            if abs(comutedResultArray.first! - copyComutedResultArray.first!) < prescision {
                break
            }
            for (index, currResult) in copyComutedResultArray.enumerated() {
                comutedResultArray[index] = currResult
            }
            
        }
        print("time passed \(CFAbsoluteTimeGetCurrent() - start)")
//        for res in comutedResultArray {
//            print("\n\(res)")
//        }
        
    }
    
    class func getSummOfIElement(firstMatrix: MatrixInterface, copyComutedResultArray: [Double], elementIndex: Int) -> Double{
        var result: Double = 0.0
        
        for i in 0..<copyComutedResultArray.count {
            if i != elementIndex {
                result += firstMatrix[elementIndex,i]*copyComutedResultArray[i]
            }
        }
        return result
    }
    
}





