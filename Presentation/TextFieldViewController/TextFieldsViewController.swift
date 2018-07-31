//
//  TextFieldsViewController.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    var foo: String?
    var bar: Int?
}

final class TextFieldsViewController: UIViewController {

    @IBOutlet private var textFields: [CustomTextField]!

    private let keyboardToolbarManager = KeyboardToolbarManager<CustomTextField>()

    override func viewDidLoad() {
        super.viewDidLoad()
        let foo = UIStackView()
//        foo.subviews.forEach(<#T##body: (UIView) throws -> Void##(UIView) throws -> Void#>)
        let keyboardToolBar: KeyboardToolbar = KeyboardToolbar.buildNib()
        textFields.forEach { $0.inputAccessoryView = keyboardToolBar }
        keyboardToolBar.delegate = keyboardToolbarManager
        keyboardToolbarManager.fields = textFields
        keyboardToolbarManager.fields.first?.foo
    }
}
