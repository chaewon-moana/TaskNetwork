//
//  LottoAPIManager.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import Alamofire

struct Lotto: Codable {
    let drwNo: Int 
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

struct LottoAPIManager {
    
    func callRequest(round: Int, completionHandler: @escaping (Lotto) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
                print("성공")
            case .failure(let failure):
                print("실패")
            }
        }
    }
    
    
}
