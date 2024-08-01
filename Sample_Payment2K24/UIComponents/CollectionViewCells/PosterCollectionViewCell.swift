//
//  PosterCollectionViewCell.swift
//  Sample_Payment2K24
//
//  Created by Aung Kyaw Phyo on 01/08/2024.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    static let identifier = String(describing: PosterCollectionViewCell.self)
    
    func posterSetup(poster: ProductPoster) {
        posterImageView.image = poster.poster
    }
    
}
