//
//  AgentScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 05/08/2024.
//

import UIKit

class AgentScreenViewController: UIViewController {
    
    @IBOutlet weak var userAmountTextField: UITextField!
    
    let trans: [Transfer] = [Transfer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        textFieldSetup()
    }
    
    private func textFieldSetup() {
        userAmountTextField.delegate = self
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension AgentScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

// MARK: - User Interaction - Actions & Targets
extension AgentScreenViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
