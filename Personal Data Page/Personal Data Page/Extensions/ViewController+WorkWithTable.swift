//
//  ViewController+UITextFieldDelegate.swift
//  Personal Data Page
//
//  Created by Kyzu on 25.10.22.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? ChildTableViewCell else {
            fatalError("Unable to dequeue TableCell")
        }
        
        cell.deleteButton.addTarget(self, action: #selector(deleteRow(_ :)), for: .touchUpInside)
        
        return cell
    }

}

