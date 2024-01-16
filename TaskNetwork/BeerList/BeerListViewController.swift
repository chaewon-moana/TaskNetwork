//
//  BeerListViewController.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import UIKit
import Kingfisher

class BeerListViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    
    let manager = BeerListManager()
    var list: [MainList] = [] {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.callRequst { value in
            self.list = value
        }
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.rowHeight = UITableView.automaticDimension
        
        let xib = UINib(nibName: "BeerListTableViewCell", bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: "BeerListTableViewCell")

    }

}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(list.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListTableViewCell", for: indexPath) as! BeerListTableViewCell
        
        cell.beerDescriptionLabel.text = list[indexPath.row].description
        cell.beerName.text = list[indexPath.row].name
        
        let url = URL(string: list[indexPath.row].image_url)
        cell.beerImageView.kf.setImage(with: url)
        
        cell.contentMode = .scaleAspectFit
        
        return cell
    }
    

    
    
}
