//
//  LoginScreenProtocols.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 29/07/2024.
//

import Foundation

protocol LoginScreenProtocols: AnyObject {
    func showTextFieldErrorLabel(error: ValidationErrors)
    func loginRouter()
}
