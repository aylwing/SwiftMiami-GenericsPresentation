//
//  KeyboardToolbarManager.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

protocol TextFieldRepresentable: Equatable {
    var isFirstResponder: Bool { get }
    func assumeFirstResponder()
    func relinquishFirstResponder()
}

extension UITextField: TextFieldRepresentable {

    func assumeFirstResponder() {
        becomeFirstResponder()
    }

    func relinquishFirstResponder() {
        resignFirstResponder()
    }
}

final class KeyboardToolbarManager<T: TextFieldRepresentable> {

    // MARK: - Public properties
    var fields: [T] = []

    // MARK: - Private functions
    private func getActiveField() -> (index: Int, field: T)? {
        return fields.lazy.enumerated().first { $0.element.isFirstResponder } as? (index: Int, field: T)
    }
}

extension KeyboardToolbarManager: KeyboardToolbarDelegate {

    func nextField() {
        guard let activeField = getActiveField() else { return }
        guard activeField.field != fields.last else { return }
        fields[activeField.index + 1].assumeFirstResponder()
    }

    func previousField() {
        guard let activeField = getActiveField() else { return }
        guard activeField.field != fields.first else { return }
        fields[activeField.index - 1].assumeFirstResponder()
    }

    func keyboardDone() {
        getActiveField()?.field.relinquishFirstResponder()
    }

    func hasNext() -> Bool {
        guard let activeField = getActiveField() else { return false }
        return activeField.field != fields.last
    }

    func hasPrevious() -> Bool {
        guard let activeField = getActiveField() else { return false }
        return activeField.field != fields.first
    }
}

