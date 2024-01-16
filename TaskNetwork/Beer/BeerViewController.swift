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
    @IBOutlet var foodPairLabel: UILabel!
    
    let manager = BeerAPIManager()
    var beer: Beer = Beer(name: "", description: "", image_url: "", food_pairing: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.callRequest { beer in
            self.beer = beer
            let url = URL(string: beer.image_url)
            self.beerName.text = beer.name
            self.BeerImage.kf.setImage(with: url)
            self.beerDescription.text = beer.description
            self.foodPairLabel.text = "Food Pair : \(beer.food_pairing.randomElement()!)"
        }
        
        setUI()
    }
    
    
    func setUI() {
        recommandLabel.text = "오늘의 맥주!🍺"
        recommandLabel.font = .boldSystemFont(ofSize: 24)
        recommandLabel.textAlignment = .center
        
        BeerImage.contentMode = .scaleAspectFit
        
        beerName.textAlignment = .center
        
        beerDescription.textAlignment = .center
        beerDescription.numberOfLines = 0
        beerDescription.font = .systemFont(ofSize: 14)
        
        otherBeerButton.setTitle("다른 맥주 추천받기", for: .normal)
        otherBeerButton.setTitleColor(.orange, for: .normal)
        
        foodPairLabel.textAlignment = .center
        foodPairLabel.font = .systemFont(ofSize: 12)
        
        
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        manager.callRequest { beer in
            
            let url = URL(string: beer.image_url)
            self.beerName.text = beer.name
            self.BeerImage.kf.setImage(with: url)
            self.beerDescription.text = beer.description
            self.foodPairLabel.text = "Food Pair : \(beer.food_pairing.randomElement()!)"

        }
    }
    
}
