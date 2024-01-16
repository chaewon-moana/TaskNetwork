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
    
    let list = Lotto(drwNo: 1102, drwtNo1: 0, drwtNo2: 0, drwtNo3: 0, drwtNo4: 0, drwtNo5: 0, drwtNo6: 0, bnusNo: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        roundTextField.inputView = lottoPickerView
        roundTextField.tintColor = .clear
        roundTextField.becomeFirstResponder()
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self

        initPicker(round: 1102)
        setUI()
    }

    func setUI() {
        roundNumber.textAlignment = .center
        roundNumber.text = "1102회차"
        
        for item in 0...numberView.count - 1 {
            numberView[item].setLottoView()
            numberLabel[item].setLottoNumber()
        }
        
        bonusView.layer.cornerRadius = 25
        bonusView.backgroundColor = .blue
        
        bonusNumber.textColor = .white
        
        bonusLabel.text = "보너스 번호"
        bonusLabel.font = .boldSystemFont(ofSize: 24)
    
    }
    
    func decideNumberViewColor(number: Int) -> UIColor {
        switch number {
        case 1...10:
            return .systemYellow
        case 11...20:
            return .systemBlue
        case 21...30:
            return .systemRed
        case 31...40:
            return .systemGray
        case 41...45:
            return .systemGreen
        default:
            print("로또배경색 에러발생")
            return .systemCyan
        }
    }

}

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
        initPicker(round: lottoList[row])
        roundNumber.text = "\(lottoList[row])회차"
    }
    
    func initPicker(round: Int) {
        manager.callRequest(round: round) { value in
            let data: [Int] = [value.drwtNo1, value.drwtNo2, value.drwtNo3, value.drwtNo4, value.drwtNo5, value.drwtNo6]
            self.setNumberColor(numbers: data, bonus: value.bnusNo)
        }
    }
    
    func setNumberColor(numbers: [Int], bonus: Int) {
        for idx in 0...numbers.count - 1 {
            self.numberLabel[idx].text = String(numbers[idx])
            self.numberView[idx].backgroundColor = self.decideNumberViewColor(number: numbers[idx])
        }
        self.bonusView.backgroundColor = self.decideNumberViewColor(number: bonus)
        self.bonusNumber.text = String(bonus)
    }
}
