//
//  LottoViewController.swift
//  TaskNetwork
//
//  Created by cho on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var roundNumber: UILabel!
    @IBOutlet var roundTextField: UITextField!
    
    @IBOutlet var numberView: [UIView]!
    @IBOutlet var numberLabel: [UILabel]!
    
    @IBOutlet var bonusLabel: UILabel!
    @IBOutlet var bonusView: UIView!
    @IBOutlet var bonusNumber: UILabel!
    
    let lottoPickerView = UIPickerView()
    let manager = LottoAPIManager()
    let lottoList: [Int] = Array(1...1102).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundTextField.inputView = lottoPickerView
        roundTextField.tintColor = .clear
        roundTextField.becomeFirstResponder()
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self

        setUI()
    }
    
    func setPicker() {
        
        
    }
    
    func setUI() {
        roundNumber.textAlignment = .center
        
        for view in numberView {
            view.backgroundColor = .systemBlue
            view.layer.cornerRadius = 25
        }
        
        bonusView.layer.cornerRadius = 25
        bonusView.backgroundColor = .blue
        
        bonusLabel.text = "보너스 번호"
        bonusLabel.font = .boldSystemFont(ofSize: 24)
        
        
    }
    

}
//www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=로또회차번호

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lottoList.count //로또 최근회차 정보 얻어올 수 있나?
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(lottoList[row]) 회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        manager.callRequest(round: lottoList[row]) { value in
            self.numberLabel[0].text = String(value.drwtNo1)
            self.numberLabel[1].text = String(value.drwtNo2)
            self.numberLabel[2].text = String(value.drwtNo3)
            self.numberLabel[3].text = String(value.drwtNo4)
            self.numberLabel[4].text = String(value.drwtNo5)
            self.numberLabel[5].text = String(value.drwtNo6)
            self.bonusNumber.text = String(value.bnusNo)

        }
        roundNumber.text = "\(lottoList[row])회차"
    }
    
}
