//
//  TransferMoneyScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 04/08/2024.
//

import UIKit

class TransferMobileNumberScreenViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var userAmountTextField: UITextField!
    @IBOutlet weak var userNotesTextField: UITextField!
    
    var upcomingTransfer: Transfer?
    
    // MARK: Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        textFieldSetup()
        mobileNumberTextField.textFieldIcon(image: UIImage(systemName: "iphone")!)
    }
    
    private func textFieldSetup() {
        mobileNumberTextField.delegate = self
        userAmountTextField.delegate = self
        userNotesTextField.delegate = self
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension TransferMobileNumberScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

// MARK: - User Interaction - Actions & Targets
extension TransferMobileNumberScreenViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
