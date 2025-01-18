//
//  ModelInput.swift
//  CoreMLModelTest
//
//  Created by Tamim Dari Chowdhury on 1/18/25.
//


class ModelInput {
    let shape: [Int]
    let inputValues: [Double]
    init(shape: [Int], inputValues: [Double]) {
        self.shape = shape
        self.inputValues = inputValues
    }
}
