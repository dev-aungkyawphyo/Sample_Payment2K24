//
//  TopUpScreenViewController.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 03/08/2024.
//

import UIKit

class TopUpScreenViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var contactBookBtn: UIButton!
    @IBOutlet weak var recentNumberTable: UITableView!
    @IBOutlet weak var amountBtn: UIButton!
    
    private var recentNumber: [RecentNumber] = [
        .init(icon: UIImage(systemName: "iphone")!, description: "No Recent Number")
    ]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        textFieldSetup()
        tableViewSetup()
        mobileNumberTextField.addCancelButton()
        mobileNumberTextField.textFieldIcon(image: UIImage(systemName: "iphone")!)
        registerSetup()
    }
    
    private func textFieldSetup() {
        mobileNumberTextField.delegate = self
    }
    
    private func tableViewSetup() {
        recentNumberTable.delegate = self
        recentNumberTable.dataSource = self
    }
    
    private func registerSetup() {
        recentNumberTable.register(UINib(nibName: RecentNumberTableViewCell.identifier, bundle: nil),
                                   forCellReuseIdentifier: RecentNumberTableViewCell.identifier)
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension TopUpScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mobileNumberTextField.resignFirstResponder()
        return true
    }
    
}

// MARK: - UITableViewDelegate
extension TopUpScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}

// MARK: - UITableViewDataSource
extension TopUpScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentNumberTableViewCell.identifier, for: indexPath) as? RecentNumberTableViewCell else {
            return UITableViewCell()
        }
        cell.recentSetup(recent: recentNumber[indexPath.row])
        return cell
    }
    
}

// MARK: - User Interaction - Actions & Targets
extension TopUpScreenViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
