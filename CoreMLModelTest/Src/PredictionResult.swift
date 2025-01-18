//
//  Untitled.swift
//  CoreMLModelTest
//
//  Created by Tamim Dari Chowdhury on 1/18/25.
//



enum PredictionStatus {
    case success
    case modelLoadFailure
    case predictionFailure
}

class PredictionResult {
    
    let status: PredictionStatus
    let output: RF_ModelOutput?
    let error: Error?
    
    init(status: PredictionStatus, output: RF_ModelOutput? = nil, error: Error? = nil) {
        self.status = status
        self.output = output
        self.error = error
    }
    
    func getDetails(error: Error? = nil) -> String {
        let errorDescription = error?.localizedDescription ?? ""
        switch self.status {
        case .success:
            return "Model Prediction Success"
        case .modelLoadFailure:
            return "Model Load Failed " + errorDescription
        case .predictionFailure:
            return "Model prediction Failed " + errorDescription
        }
    }
}
