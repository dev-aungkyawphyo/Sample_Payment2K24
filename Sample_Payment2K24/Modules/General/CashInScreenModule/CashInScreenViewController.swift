//
//  CashInScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 03/08/2024.
//

import UIKit

class CashInScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var transfer: [Transfer] = [
        .init(recent: RecentNumber(icon: UIImage(named: "bank")!, description: "Cash In by Bank Account"), title: "Bank Account"),
        .init(recent: RecentNumber(icon: UIImage(named: "agent")!, description: "Cash in by agent"), title: "Agent"),
        .init(recent: RecentNumber(icon: UIImage(named: "visa")!, description: "Visa/MasterCard/JCB"), title: "Visa/MasterCard/JCB"),
        .init(recent: RecentNumber(icon: UIImage(named: "mpuPay")!, description: "MPU"), title: "MPU"),
        .init(recent: RecentNumber(icon: UIImage(named: "group")!, description: "Friend & Family"), title: "Friend & Family")
    ]

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
extension CashInScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = AgentScreenViewController.instantiate(name: .AgentScreenBaseRouter)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: - UITableViewDataSource
extension CashInScreenViewController: UITableViewDataSource {
    
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
extension CashInScreenViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
