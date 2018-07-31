//
//  CustomTableViewCell.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var numberLabel: UILabel!

    static let identifier = String(describing: CustomTableViewCell.self)

    func set(text: String) {
        numberLabel.text = text
    }
}
