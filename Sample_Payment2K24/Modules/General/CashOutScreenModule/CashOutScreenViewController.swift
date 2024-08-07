//
//  CashOutScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 03/08/2024.
//

import UIKit

class CashOutScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private var transfer: [Transfer] = [
        .init(recent: RecentNumber(icon: UIImage(named: "bank")!, description: "Cash out to linked bank sub"), title: "Cash Out to Bank Account"),
        .init(recent: RecentNumber(icon: UIImage(named: "agent")!, description: "Cash out agent sub"), title: "Cash Out at Agent"),
        .init(recent: RecentNumber(icon: UIImage(named: "atm")!, description: "Cash out ATM"), title: "ATM")
    ]

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        tableViewSetup()
        registerSetup()
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
    }
    
    private func registerSetup() {
        tableView.register(UINib(nibName: TransferTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: TransferTableViewCell.identifier)
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITableViewDelegate
extension CashOutScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Need action didselect
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: - UITableViewDataSource
extension CashOutScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return transfer.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransferTableViewCell.identifier, for: indexPath) as? TransferTableViewCell else {
            return UITableViewCell()
        }
        cell.setupTransfer(transfer: transfer[indexPath.section])
        return cell
    }
    
}

// MARK: - User Interaction - Actions & Targets
extension CashOutScreenViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
