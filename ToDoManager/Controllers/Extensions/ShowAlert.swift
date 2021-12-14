//
//  ShowAlert.swift
//  ToDoManager
//
//  Created by Roman Korobskoy on 13.12.2021.
//

import UIKit

extension UIViewController {

    public func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertOk)
    
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
