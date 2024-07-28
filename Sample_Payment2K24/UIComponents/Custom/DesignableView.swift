//
//  DesignableView.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 29/07/2024.
//

import Foundation
import UIKit

class DesignableView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor(named: "PrimaryTextColor")?.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 20
    }
    
}
