//
//  GenericTableViewController.swift
//  Presentation
//
//  Created by Aylwing Olivas on 7/25/18.
//  Copyright © 2018 Aylwing Olivas. All rights reserved.
//

import UIKit

final class GenericTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(cellType: CustomTableViewCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(text: UUID().uuidString)
        return cell
    }
}
