//
//  UIButton+customButton.swift
//  Personal Data Page
//
//  Created by Kyzu on 25.10.22.
//

import UIKit

extension UIButton {
    static func roundedButton(imageName: String?, title: String, color: UIColor ) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = color.cgColor
        if let imageName = imageName {
        button.setImage(UIImage(systemName: imageName), for: .normal)
            button.imageEdgeInsets.left = -10
            button.tintColor = color
        }
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }
    
    static func deleteButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }
}
