//
//  ViewController.swift
//  CoreMLModelTest
//
//  Created by Tamim Dari Chowdhury on 1/18/25.
//

import UIKit
import CoreML


class ViewController: UIViewController {
    
    private var modelInput: ModelInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modelInput = ModelInput(shape: [6], inputValues: [0.0, 200.0, 207.0, 207.0, 76.421, 1990.0])
        
        let result = getModelPredictionFor(inputValues: modelInput)
        
        switch result.status {
        case .success:
            print("Model prediction output: \(result.output!.prediction)")
        default:
            print(result.getDetails(error: result.error))
            break
        }
    }
    
}
    
   
extension ViewController {
    private func getModelPredictionFor(inputValues: ModelInput) -> PredictionResult {
        do {
            let model = try RF_Model(configuration: MLModelConfiguration())
            
            let inputShapedArray = MLShapedArray<Double>(scalars: modelInput.inputValues, shape: modelInput.shape)
            
            let model_input = RF_ModelInput(input: inputShapedArray)
            
            do{
                let result = try model.prediction(input: model_input)
                return PredictionResult(status: .success, output: result)
            }catch{
                return PredictionResult(status: .predictionFailure, output: nil, error: error)
            }
            
        }catch{
            return PredictionResult(status: .modelLoadFailure, output: nil, error: error)
        }
        
    }
}
