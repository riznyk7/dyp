//
//  MatrixGeneration.swift
//  Kursovaja
//
//  Created by Piter Miller on 15.05.17.
//  Copyright © 2017 Piter Miller. All rights reserved.
//

import Foundation

class MatrixGeneration {
    
    init() {
    }
    
    func getMatrix(rows: Int, columns: Int, percentageOfNotZero: Double, decreaseBy: Double, sizeOfFirsCompareToSecond compare: Double) -> Matrix{
        var resultDataFirst: [Double] = []    // Matrix(rows: rows, columns: firstColumns)
        
        for _ in 0..<rows {
            let generatedRaw = generateRow(size: columns, percentageOfNotZero: percentageOfNotZero, decreaseBy: decreaseBy)
            resultDataFirst.append(contentsOf: generatedRaw)
        }
        return Matrix(resultDataFirst, rows: rows, columns: columns)
    }
    
    func generateRow(size: Int, percentageOfNotZero: Double, decreaseBy: Double) -> [Double] {
        var resultArray = Array<Double>(repeating: 0.0, count: size)
        var summ: Double = 0.0
        var notZero = 0
        for i in 0..<resultArray.count {
            if drand48() < percentageOfNotZero {
                var newVal = drand48()
                resultArray[i] = newVal.roundTo(precision: 100)
                summ += resultArray[i]
                notZero += 1
            }
        }
        summ *= decreaseBy
        // Normalize
        var newSumm: Double = 0.0
        for i in 0..<resultArray.count {
            if resultArray[i] > 0 {
                var newVal = (resultArray[i] / summ)
                resultArray[i] = newVal.roundTo(precision: 100)
                newSumm += resultArray[i]
            }
            
        }
        
        return resultArray
    }
    
    
}

extension Double {
    
    mutating func roundTo(precision: Int) -> Double {
        return Double(Darwin.round(Double(precision)*self)/Double(precision))
    }
    
}
