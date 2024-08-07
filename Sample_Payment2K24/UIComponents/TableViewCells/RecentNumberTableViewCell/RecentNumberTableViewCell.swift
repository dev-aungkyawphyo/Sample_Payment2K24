//
//  RecentNumberTableViewCell.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 03/08/2024.
//

import UIKit

class RecentNumberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = String(describing: RecentNumberTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func recentSetup(recent: RecentNumber) {
        iconImageView.image = recent.icon
        iconImageView.tintColor = .appColor(.tertiaryTextColor)
        descriptionLabel.text = recent.description
    }
    
}
