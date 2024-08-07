//
//  HistoryTableViewCell.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 07/08/2024.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    static let identifier = String(describing: HistoryTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupHistoryRecent(recent: HistoryRecent) {
        iconImageView.image = recent.transfer.recent.icon
        titleLabel.text = recent.transfer.title
        dateTimeLabel.text = recent.transfer.recent.description
        amountLabel.text = "+\(recent.amount) MMK"
    }
    
}
