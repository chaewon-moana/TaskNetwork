//
//  BeerListManager.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import Foundation
import Alamofire

struct TotalList: Codable {
    let data: MainList
}

struct MainList: Codable {
    let name: String
    let description: String
    let image_url: String
}


struct BeerListManager {
    let url = "https://api.punkapi.com/v2/beers"
    
    func callRequst(completionHandler: @escaping ([MainList]) -> Void) {
        AF.request(url).responseDecodable(of: [MainList].self) { response in
            switch response.result {
            case .success(let success):
            completionHandler(success)
                print("성공")
                print(success.count)
            case .failure(let failure):
                print("실패")
            }
        }
    }
}
