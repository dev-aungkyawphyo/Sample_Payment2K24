//
//  RoundedButton.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 29/07/2024.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}

