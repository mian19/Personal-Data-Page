//
//  ChildTableViewCell.swift
//  Personal Data Page
//
//  Created by Kyzu on 25.10.22.
//

import UIKit

class ChildTableViewCell: UITableViewCell {

    var childName = CustomTextField.customTF(placeholder: .name)
    var childAge = CustomTextField.customTF(placeholder: .age)
    var deleteButton = UIButton.deleteButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(childName)
        contentView.addSubview(childAge)
        contentView.addSubview(deleteButton)
        setElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElements() {
        NSLayoutConstraint.activate([
            childName.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            childName.leadingAnchor.constraint(equalTo: leadingAnchor),
            childName.widthAnchor.constraint(equalToConstant: 200),
            childAge.topAnchor.constraint(equalTo: childName.bottomAnchor, constant: 15),
            childAge.leadingAnchor.constraint(equalTo: childName.leadingAnchor),
            childAge.widthAnchor.constraint(equalTo: childName.widthAnchor),
            deleteButton.centerYAnchor.constraint(equalTo: childName.centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: childName.trailingAnchor, constant: 20)
        ])
    }

}
