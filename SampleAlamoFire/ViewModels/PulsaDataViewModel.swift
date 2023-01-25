//
//  PulsaDataViewModel.swift
//  SampleAlamoFire
//
//  Created by Qoin on 13/01/23.
//

import Foundation

class PulsaDataViewModel: ObservableObject {
    
    @Published var phoneNumber: String = ""
    
//    func inquiry(request: LoginRequest) {
//        ApiService.shared.callCreateLogin(parameters: request.dictionary ?? [:]) { response in
//            if response != nil {
//                self.isCanLogin = true
//            }
//        }
//            failure: { error in
//               print(error)
//            }
//    }
}
