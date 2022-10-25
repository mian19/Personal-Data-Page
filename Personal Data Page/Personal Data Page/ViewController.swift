//
//  ViewController.swift
//  Personal Data Page
//
//  Created by Kyzu on 25.10.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var personalDataLabel: UILabel!
    private var parentName: CustomTextField!
    private var parentAge: CustomTextField!
    private var childrenLabel: UILabel!
    private var addChildButton: UIButton!
    private var clearButton: UIButton!
    var childrenTable: UITableView!
    var cellsCount = 0
    
    
    override func loadView() {
        setView()
        setPersonalDataLabel()
        setParentFields()
        setChildrenLabel()
        setAddChildButton()
        setChildrenTable()
        setClearButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        registerForKeyboardNotifications()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize =  CGSize(width: view.bounds.width, height: clearButton.frame.maxY + 60)
    }

    private func setView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(focus)))
        view.addSubview(scrollView)
    }
    
    private func setPersonalDataLabel() {
        personalDataLabel = UILabel.infoLabel(text: "Персональные данные")

        scrollView.addSubview(personalDataLabel)
    }
    
    private func setParentFields() {
        parentName = CustomTextField.customTF(placeholder: .name)
        parentAge = CustomTextField.customTF(placeholder: .age)
        scrollView.addSubview(parentName)
        scrollView.addSubview(parentAge)
    }
    
    private func setChildrenLabel() {
        childrenLabel = UILabel.infoLabel(text: "Дети(макс. 5)")
        scrollView.addSubview(childrenLabel)
    }
    
    private func setAddChildButton() {
        addChildButton = UIButton.roundedButton(imageName: "plus", title: "Добавить ребенка", color: .systemBlue)
        addChildButton.addTarget(self, action: #selector(onAddButton), for: .touchUpInside)
        scrollView.addSubview(addChildButton)
    }
    
    private func setChildrenTable() {
        childrenTable = UITableView()
        childrenTable.delegate = self
        childrenTable.dataSource = self
        childrenTable.backgroundColor = .clear
        childrenTable.register(ChildTableViewCell.self, forCellReuseIdentifier: "TableCell")
        childrenTable.translatesAutoresizingMaskIntoConstraints = false
        childrenTable.rowHeight = 170
        scrollView.addSubview(childrenTable)
    }
    
    private func setClearButton() {
        clearButton = UIButton.roundedButton(imageName: nil, title: "Очистить", color: .systemRed)
        clearButton.addTarget(self, action: #selector(onClearButton), for: .touchUpInside)
        scrollView.addSubview(clearButton)
    }
    
    private func setElements() {
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            personalDataLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            personalDataLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            parentName.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 20),
            parentName.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: parentName.trailingAnchor, constant: 20),
           
            parentAge.topAnchor.constraint(equalTo: parentName.bottomAnchor, constant: 10),
            parentAge.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor),
            parentAge.trailingAnchor.constraint(equalTo: parentName.trailingAnchor),
            
            childrenLabel.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor),
            childrenLabel.topAnchor.constraint(equalTo: parentAge.bottomAnchor, constant: 20),
            childrenLabel.widthAnchor.constraint(equalToConstant: 130),
            
            addChildButton.topAnchor.constraint(equalTo: parentAge.bottomAnchor, constant: 10),
            addChildButton.leadingAnchor.constraint(equalTo: childrenLabel.trailingAnchor, constant: 15),
            addChildButton.trailingAnchor.constraint(equalTo: parentAge.trailingAnchor),
            addChildButton.heightAnchor.constraint(equalToConstant: 50),
            
            childrenTable.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor),
            childrenTable.trailingAnchor.constraint(equalTo: parentName.trailingAnchor),
            childrenTable.topAnchor.constraint(equalTo: addChildButton.bottomAnchor),
            childrenTable.heightAnchor.constraint(equalToConstant: 350),
            
            clearButton.heightAnchor.constraint(equalToConstant: 50),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 200),
            clearButton.topAnchor.constraint(equalTo: childrenTable.bottomAnchor, constant: 20)
        ])
    }
    
    //MARK: - Actions
    
    @objc private func focus() {
        scrollView.endEditing(true)
    }
    
    @objc private func onAddButton() {
        if cellsCount < 5 {
            cellsCount += 1
            childrenTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
        }
        
        if cellsCount == 5 {
            addChildButton.isHidden = true
        }
    }
    
    @objc private func onClearButton() {
        let alert = UIAlertController(title: nil, message: "Сбросить данные?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: {_ in
            self.cellsCount = 0
            self.childrenTable.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    @objc func deleteRow(_ sender:UIButton) {
        let point = sender.convert(CGPoint.zero, to: childrenTable)
        guard let indexPath = childrenTable.indexPathForRow(at: point) else { return }
        cellsCount -= 1
        childrenTable.deleteRows(at: [indexPath], with: .left)
    }
    
    //MARK: - moveKeyboard
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(_ notification: Notification) {
        
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        let offset = view.frame.maxY - childrenTable.frame.maxY
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        } else {
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: keyboardViewEndFrame.height - offset)
        }
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
}

