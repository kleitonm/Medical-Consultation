//
//  WebService.swift
//  Medical-Consultation
//
//  Created by Kleiton Mendes on 06/11/25.
//

import UIKit

let patientID = "b25aa67b-203e-4a79-b0e0-3f5c560cd317"

struct WebService {
    
    private var baseURL = "http://localhost:3000"
    
    func cancelAppointment(appointmentID: String, reasonToCancel: String) async throws -> Bool {
        let endpoint = baseURL + "/consultar/" + appointmentID
        
        guard let url = URL(string: endpoint) else {
            print("Error na URL!")
            return false
        }
        
        let requestData: [String: String] = ["motivoCancelamento" : reasonToCancel]
        
        let jsonData = try JSONSerialization.data(withJSONObject: requestData)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 {
            return true
        }
        return false
    }
    
    
}
