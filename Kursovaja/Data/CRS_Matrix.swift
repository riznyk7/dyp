//
//  CRS_Matrix.swift
//  Kursovaja
//
//  Created by Piter Miller on 21.05.17.
//  Copyright © 2017 Piter Miller. All rights reserved.
//

import Foundation

class CRS_Matrix: MatrixInterface {
    
    var rows: Int
    var columns: Int
    
    var data: [Double]
    var lj: [Int]
    var li: [Int]
    
    required init(_ matrix: Matrix) {
        self.rows = matrix.rows
        self.columns = matrix.columns
        lj = []
        li = [0]
        data = []
        for i in 0..<matrix.rows {
            var entriesInARow = 0
            for j in 0..<matrix.columns {
                if matrix[i,j] != 0.0 {
                    data.append(matrix[i,j])
                    lj.append(j)
                    entriesInARow += 1
                }
                
            }
            li.append(li[i] + entriesInARow)
            
        }
        
    }

    
    
    subscript(row: Int, col: Int) -> Double {
        get {
            for k in li[row]..<li[row+1] {
                if lj[k] == col {
                    return data[k]
                }
            }
            
            return 0.0
        }
        set {
            
        }
    }

    
    
    
}
