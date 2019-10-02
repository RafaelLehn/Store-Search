//
//  MenuViewController.swift
//  StoreSearch
//
//  Created by Webeleven on 01/10/19.
//  Copyright © 2019 Rafael Lehn. All rights reserved.
//

import UIKit
protocol MenuViewControllerDelegate: class {
    func menuViewControllerSendEmail(_ controller:
        MenuViewController)
}
class MenuViewController: UITableViewController {

    weak var delegate: MenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            delegate?.menuViewControllerSendEmail(self)
        }
    }
}
