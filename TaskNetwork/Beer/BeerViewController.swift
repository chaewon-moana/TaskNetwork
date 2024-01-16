//
//  BeerViewController.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    
    @IBOutlet var recommandLabel: UILabel!
    @IBOutlet var BeerImage: UIImageView!
    @IBOutlet var beerName: UILabel!
    @IBOutlet var beerDescription: UILabel!
    @IBOutlet var otherBeerButton: UIButton!
    
    let manager = BeerAPIManager()
    var beer: Beer = Beer(name: "", description: "", image_url: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.callRequest { beer in
            self.beer = beer
            let url = URL(string: beer.image_url)
            self.beerName.text = beer.name
            self.BeerImage.kf.setImage(with: url)
            self.beerDescription.text = beer.description
        }
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        manager.callRequest { beer in
            
            let url = URL(string: beer.image_url)
            self.beerName.text = beer.name
            self.BeerImage.kf.setImage(with: url)
            self.beerDescription.text = beer.description
        }
    }
    
}
