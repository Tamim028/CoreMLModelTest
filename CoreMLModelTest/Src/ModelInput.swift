//
//  ModelInput.swift
//  CoreMLModelTest
//
//  Created by Tamim Dari Chowdhury on 1/18/25.
//


class Input {
    let shape: [Int]
    let values: [Double]
    init(shape: [Int], values: [Double]) {
        self.shape = shape
        self.values = values
    }
}
