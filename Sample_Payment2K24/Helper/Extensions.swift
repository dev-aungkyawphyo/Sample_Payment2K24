//
//  Extensions.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 28/07/2024.
//

import Foundation
import UIKit

extension UITextField {
    
    var inputValue: String {
        return self.text ?? ""
    }
    
    func designableIcon(image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = image
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        iconContainerView.addSubview(imageView)
        leftView = iconContainerView
        leftViewMode = .always
        self.tintColor = .appColor(.tertiaryTextColor)
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor(named: "PrimaryTextColor")?.cgColor
        self.layer.addSublayer(bottomLayer)
    }
    
    func addVisibleButton() {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        let container: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
        container.addSubview(button)
        rightView = container
        rightViewMode = .always
        button.addTarget(self, action: #selector(visibleBtnAction(_:)), for: .touchUpInside)
    }
    
    @objc private func visibleBtnAction(_ sender: UIButton) {
        self.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
}

extension UIColor {
    
    static func appColor(_ name: AssetColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate(name: BaseRouter) -> Self {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
    
    enum BaseRouter: String {
        case DesignableTabBarScreenViewController = "Main"
    }
    
}
