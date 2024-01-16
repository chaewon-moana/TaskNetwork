//
//  BeerListTableViewCell.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import UIKit

class BeerListTableViewCell: UITableViewCell {

    @IBOutlet var beerName: UILabel!
    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        beerDescriptionLabel.numberOfLines = 0
        beerDescriptionLabel.font = .systemFont(ofSize: 12)
        
    }


}
