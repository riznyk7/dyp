//
//  AppDelegate.swift
//  Kursovaja
//
//  Created by Piter Miller on 15.05.17.
//  Copyright © 2017 Piter Miller. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let generator = MatrixGeneration()
        let rows  = 5000
        var matrix: Matrix? = generator.getMatrix(rows: rows, columns: rows, percentageOfNotZero: 0.1, decreaseBy: 1.2, sizeOfFirsCompareToSecond: 0)
        var resultVector: [Double] = []
        for i in 0..<rows {
            resultVector.append(10*drand48())
        }
//        let matrix = Matrix([0,0,0,0.1,
//                             0,0,0,0.2,
//                             0,3,0,3], rows: 3, columns: 3)
        
        
//        let coo = COO_Matrix(matrix!)
        
        let crs = CRS_Matrix(matrix!)
        matrix = nil
        
        
        
//        Algo.calculate(firstMatrix: coo, resultVector: resultVector, prescision: 0.001)
//        print("\n\n\n\n")
        Algo.calculate(firstMatrix: crs, resultVector: resultVector, prescision: 0.001)
        print("\n\n\n\n")
//        Algo.calculate(firstMatrix: matrix!, resultVector: resultVector, prescision: 0.001)
        
//        Algo.calculate(firstMatrix: matrix!, resultVector: resultVector, prescision: 0.000001)
//        Algo.calculate(firstMatrix: matrix!, resultVector: resultVector, prescision: 0.000000001)
//        Algo.calculate(firstMatrix: matrix!, resultVector: resultVector, prescision: 0.000000000001)
        
        return true
    }

    

}

