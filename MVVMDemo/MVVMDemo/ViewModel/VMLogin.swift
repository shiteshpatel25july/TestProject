//
//  VMLogin.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation


protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel {
    var delegate : LoginViewModelDelegate?
    
    func loginUser(loginRequest: LoginRequest) {
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)
        if validationResult.success {
            let loginUrl = URL(string: ApiEndpoints.login)!
            do {
                let requestBody = try JSONEncoder().encode(loginRequest)
                let serviceManager = ServiceManager()
                
                serviceManager.postAPIData(requestUrl: loginUrl, requestBody: requestBody, resultType: LoginResponse.self) { (response) in
                    if response?.errorMessage == nil && response?.data != nil {
                        UserDefaultUtility().saveUserId(userId: response!.data!.userID)
                        
                        DispatchQueue.main.async {
                            self.delegate?.didReceiveLoginResponse(loginResponse: response)
                        }
                    }
                }
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        } else {
            self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
        }
    }
}
