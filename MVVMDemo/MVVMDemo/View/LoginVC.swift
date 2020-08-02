//
//  LoginVC.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, LoginViewModelDelegate{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loginViewModel.delegate = self
        self.userName.text = "codecat15@gmail.com"
        self.password.text = "1234"
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Login button tapped
    @IBAction func didTapOnLoginButton(_ sender: Any) {
        let loginRequest = LoginRequest(userEmail: self.userName.text, userPassword: self.password.text)
        loginViewModel.loginUser(loginRequest: loginRequest)
    }
    
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        if loginResponse?.errorMessage == nil && loginResponse?.data != nil {
            debugPrint("Login success: \(String(describing: loginResponse?.data!))")
            self.performSegue(withIdentifier: "navigateToEmployeView", sender: nil)
        } else {
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: loginResponse?.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

extension LoginVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
