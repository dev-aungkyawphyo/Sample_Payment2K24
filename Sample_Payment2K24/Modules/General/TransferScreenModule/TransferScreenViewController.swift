//
//  TransferScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 03/08/2024.
//

import UIKit

class TransferScreenViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var transferTable: UITableView!
    
    // MARK: Properties
    var transfer: [Transfer] = [
        .init(recent: RecentNumber(icon: UIImage(named: "wallet")!,
                                   description: "To Sample Pay Wallet Account Phone Number"),
              title: "Sample Pay Number"),
        .init(recent: RecentNumber(icon: UIImage(named: "idCard")!,
                                   description: "With Receiver's NRIC Number"),
              title: "NRIC"),
        .init(recent: RecentNumber(icon: UIImage(named: "cashCode")!, 
                                   description: "To Receiver's Mobile Number with Cash Code"),
              title: "Cash Code"),
        .init(recent: RecentNumber(icon: UIImage(named: "payment")!,
                                   description: "To Multiple Receivers with Random Amount Distribution"),
              title: "Mote Phoe")
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
        transferTable.delegate = self
        transferTable.dataSource = self
        transferTable.isScrollEnabled = false
    }
    
    private func registerSetup() {
        transferTable.register(UINib(nibName: TransferTableViewCell.identifier, bundle: nil),
                               forCellReuseIdentifier: TransferTableViewCell.identifier)
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITableViewDelegate
extension TransferScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TransferMobileNumberScreenViewController.instantiate(name: .TransBaseRouter)
        vc.upcomingTransfer = transfer[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: - UITableViewDataSource
extension TransferScreenViewController: UITableViewDataSource {
    
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
extension TransferScreenViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
