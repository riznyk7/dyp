//
//  MatrixInterFace.swift
//  Kursovaja
//
//  Created by Piter Miller on 20.05.17.
//  Copyright © 2017 Piter Miller. All rights reserved.
//

import Foundation

protocol MatrixInterface {
    
    subscript(row: Int, col: Int) -> Double { get set}
    
}
