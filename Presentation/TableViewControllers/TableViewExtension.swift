//
//  TableViewExtension.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(cellType: T.Type) {
        let reuseIdentifier = String(describing: T.self)
        register(UINib(nibName: reuseIdentifier, bundle: Bundle(for: T.self)), forCellReuseIdentifier: reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            assertionFailure("Unable to dequeue a cell for \(reuseIdentifier)")
            return T()
        }

        return cell
    }

}
