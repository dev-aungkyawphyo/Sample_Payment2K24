//
//  TransferTableViewCell.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 04/08/2024.
//

import UIKit

class TransferTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = String(describing: TransferTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupTransfer(transfer: Transfer) {
        iconImageView.image = transfer.recent.icon
        titleLabel.text = transfer.title
        descriptionLabel.text = transfer.recent.description
    }
    
}
