//
//  BeerAPIManager.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import Foundation
import Alamofire

struct Beer: Codable {
    let name: String
    let description: String
    let image_url: String
    let food_pairing: [String]
}

//struct Test: Codable {
//    let data: Beer
//}
//struct Food {
//    let menu: [String]
//}

struct BeerAPIManager {
    let url = "https://api.punkapi.com/v2/beers/random"
    
    func callRequest(completionHandler: @escaping (Beer) -> Void) {
        AF.request(url).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success[0])
                print(success)
            case .failure(let failure):
                print("실패")
            }
        }
    }
}
