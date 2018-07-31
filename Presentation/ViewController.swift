//
//  ViewController.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBAction private func nonGenericButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(NonGenericTableViewController(), animated: true)
    }
    
    @IBAction private func genericButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(GenericTableViewController(), animated: true)
    }

    @IBAction private func textFieldsButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(TextFieldsViewController(), animated: true)
    }
}

