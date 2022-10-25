//
//  UILabel+infoLabel.swift
//  Personal Data Page
//
//  Created by Kyzu on 25.10.22.
//

import UIKit


extension UILabel {
    static func infoLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }
}
