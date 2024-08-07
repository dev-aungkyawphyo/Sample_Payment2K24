//
//  WalletScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 31/07/2024.
//

import UIKit

class MyWalletScreenViewController: UIViewController {
    
    @IBOutlet weak var userAmountLabel: UILabel!
    @IBOutlet weak var visibleButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var account: Account!
    
    private var recent: [RecentNumber] = [
        .init(icon: UIImage(named: "bank")!, description: "Bank Accounts"),
        .init(icon: UIImage(named: "idCard")!, description: "Cards"),
        .init(icon: UIImage(named: "coupon")!, description: "My Vouchers"),
        .init(icon: UIImage(named: "hot-sale")!, description: "My Deals")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        account = Bank.currentAccount!
        configureUI()
        tableViewSetup()
        registerSetup()
        addVisibleButton()
    }
    
    private func configureUI() {
        userAmountLabel.text = "\(account.amount) MMK"
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
    }
    
    private func registerSetup() {
        tableView.register(UINib(nibName: RecentNumberTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: RecentNumberTableViewCell.identifier)
    }
    
    private func addVisibleButton() {
        visibleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        visibleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        visibleButton.addTarget(self, action: #selector(addVisibleBtnTapped(_:)), for: .touchUpInside)
    }
    
    @objc func addVisibleBtnTapped(_ button: UIButton) {
        if button.isSelected == true {
            button.isSelected = false
            userAmountLabel.text = String("\(account.amount) MMK")
        } else {
            button.isSelected = true
            let str = "* * * * * *"
            userAmountLabel.text = str
        }
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: UITableViewDelegate
extension MyWalletScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Need action
    }
    
}

// MARK: UITableViewDataSource
extension MyWalletScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recent.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentNumberTableViewCell.identifier, for: indexPath) as? RecentNumberTableViewCell else {
            return UITableViewCell()
        }
        cell.recentSetup(recent: recent[indexPath.section])
        return cell
    }
    
}

