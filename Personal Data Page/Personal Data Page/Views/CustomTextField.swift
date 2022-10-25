//
//  CustomTextField.swift
//  Personal Data Page
//
//  Created by Kyzu on 25.10.22.
//

import UIKit

enum Placeholder: String {
    case name = "Имя"
    case age = "Возраст"
}

class CustomTextField: UITextField {
    
    //  var floatingLabelHeight: CGFloat = 16 // Default height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 5
        clipsToBounds = true
        font = UIFont.systemFont(ofSize: 16.0)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func customTF(placeholder: Placeholder) -> CustomTextField {
        let textField = CustomTextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        textField.returnKeyType = .done
        textField.backgroundColor = .white
        textField.textColor = .black
        
        if placeholder == .age {
            textField.keyboardType = .numberPad
        }
        
        let floatingLabel: UILabel = UILabel()
        floatingLabel.textColor = .gray
        floatingLabel.font = UIFont.systemFont(ofSize: 15)
        floatingLabel.text = placeholder.rawValue
        floatingLabel.layer.backgroundColor = UIColor.white.cgColor
        floatingLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(floatingLabel)
        
        floatingLabel.topAnchor.constraint(equalTo: textField.topAnchor, constant: 12).isActive = true
        floatingLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 20).isActive = true
        
        return textField
    }
    
    let padding = UIEdgeInsets(top: 25, left: 20, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
