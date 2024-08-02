//
//  LoginScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 29/07/2024.
//

import UIKit
import GoogleSignIn

class LoginScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var bank = Bank()
    var delegate: LoginScreenProtocols?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        passwordTextField.addVisibleButton()
        textFieldSetup()
        iconSetup()
    }
    
    private func textFieldSetup() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func iconSetup() {
        usernameTextField.designableIcon(image: UIImage(systemName: "person.fill")!)
        passwordTextField.designableIcon(image: UIImage(systemName: "lock.fill")!)
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            usernameErrorLabel.text = ""
        } else {
            passwordErrorLabel.text = ""
        }
    }
    
}

extension LoginScreenViewController: LoginScreenProtocols {
    
    func showTextFieldErrorLabel(error: ValidationErrors) {
        if error == .usernameError {
            usernameErrorLabel.text = error.rawValue
        } else {
            passwordErrorLabel.text = error.rawValue
        }
    }
    
    func loginRouter() {
        let vc = DesignableTabBarScreenViewController.instantiate(name: .DesignableTabBarScreenViewController)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

// MARK: - User Interaction - Actions & Targets
extension LoginScreenViewController {
    
    @IBAction func didTappedLoginBtn(_ sender: CustomButton) {
        if let user = bank.userLogin(username: usernameTextField.inputValue, password: passwordTextField.inputValue) {
            Bank.currentAccount = user
            loginRouter()
        } else {
            print("login failed")
            // TODO: Check login error message
        }
    }
    
    @IBAction func didTappedGoogleBtn(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { GIDSignInResult, error in
            guard let googleUser = GIDSignInResult?.user,
                  let userId = googleUser.userID,
                  let idToken = googleUser.idToken else {
                print("Error: ID token missing!")
                return
            }
            print(userId)
            print(idToken)
            self.loginRouter()
        }
    }
    
    @IBAction func didTappedFacebookBtn(_ sender: UIButton) {
        // TODO: Action need
    }
    
    @IBAction func didTappedRegisterBtn(_ sender: UIButton) {
        // TODO: Action need
    }
    
}

