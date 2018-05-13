//
//  COO_Matrix.swift
//  Kursovaja
//
//  Created by Piter Miller on 17.05.17.
//  Copyright © 2017 Piter Miller. All rights reserved.
//

import Foundation

class COO_Vector {
    
    var row: Int
    var values: [Int: Double]
    
    init(row: Int, values: [Int: Double]) {
        self.row = row
        self.values = values
    }
    
}

class COO_Matrix: MatrixInterface {
    
    var rows: Int
    var columns: Int
    
    var r: [COO_Vector]
    
    required init(_ matrix: Matrix) {
        self.rows = matrix.rows
        self.columns = matrix.columns
        r = []
        for i in 0..<matrix.rows {
            let newR = COO_Vector(row: i, values: [:])
            for j in 0..<matrix.columns {
                if matrix[i,j] != 0.0 {
                    newR.values[j] = matrix[i,j]
                }
                
            }
            r.append(newR)
        }
        
    }

    subscript(row: Int, col: Int) -> Double {
        get {
            return r[row].values[col] ?? 0
        }
        set {
            
        }
    }

}
