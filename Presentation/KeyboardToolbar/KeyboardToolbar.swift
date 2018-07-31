//
//  KeyboardToolbar.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

protocol KeyboardToolbarDelegate: class {
    func nextField()
    func previousField()
    func keyboardDone()
    func hasNext() -> Bool
    func hasPrevious() -> Bool
}

final class KeyboardToolbar: UIView {

    @IBOutlet private var segmentedControl: UISegmentedControl!
    @IBOutlet private var doneButton: UIBarButtonItem!

    // MARK: - Public properties
    weak var delegate: KeyboardToolbarDelegate? {
        didSet {
            updateEnabledStates()
        }
    }

    static let nibView: KeyboardToolbar = buildNib()

    // MARK: - Private properties
    private enum Direction: Int {
        case previous
        case next
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateEnabledStates()
    }

    // MARK: - IBActions
    @IBAction private func segmentedControlChanged(_ sender: UISegmentedControl) {
        guard let direction = Direction(rawValue: sender.selectedSegmentIndex) else {
            assertionFailure("Invalid segmented control index selected.")
            return
        }

        processTap(for: direction)
    }

    @IBAction private func doneTapped(_ sender: AnyObject) {
        delegate?.keyboardDone()
    }

    // MARK: - Private functions
    private func updateEnabledStates() {
        let hasPrevious = delegate?.hasPrevious() == true
        let hasNext = delegate?.hasNext() == true
        segmentedControl.setEnabled(hasPrevious, forSegmentAt: 0)
        segmentedControl.setEnabled(hasNext, forSegmentAt: 1)
        segmentedControl.isHidden = !hasPrevious && !hasNext
    }

    private func processTap(for direction: Direction) {
        // Add a small delay to show the highlight state.
        let delay = 0.1499
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            switch direction {
            case .previous:
                self.delegate?.previousField()
            case .next:
                self.delegate?.nextField()
            }
        }
    }
}

