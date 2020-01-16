//
//  ViewController.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/14/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var horoscopePicker: UIPickerView!
    
    @IBOutlet weak var storedInfoLabel: UILabel!
    
    private var horoscopesOnlineList = [String]() {
        didSet {
            DispatchQueue.main.async {
                //
            }
        }
    }
    private var horoscopeAllData = [HoroscopeSign]()
    

    
    private var name: String?{
        didSet{
            //update UI
            storedInfoLabel.text! = "Name:\n\(String(describing: UserPreferences.shared.getName()))\nSign: \(String(describing: UserPreferences.shared.getHoroscope()))"
            //store data
            UserPreferences.shared.storeName(with: name ?? "")
            
        }
    }
    
    private var horoscope: String?{
        didSet{
            //update UI
            storedInfoLabel.text! = "Name:\n\(String(describing: UserPreferences.shared.getName()))\nSign: \(String(describing: UserPreferences.shared.getHoroscope()))"
            //store data
            UserPreferences.shared.storeHoroscope(with: horoscope ?? "none selected")
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horoscopePicker.dataSource = self
        horoscopePicker.delegate = self
        nameTextField.delegate = self
        labelUpdated()
    }
    
    
    func labelUpdated(){
        //store name
    
        storedInfoLabel.text! = "Name:\(UserPreferences.shared.getName() ?? "")\nSign: \(UserPreferences.shared.getHoroscope()?.uppercased() ?? "")"
    }
    
    
    @IBAction func viewHoroscopeButton(_ sender: UIButton) {
        guard let detailController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            fatalError("failed to downcast to  detail view controller")
        }
        detailController.chosenHoroscope = horoscope ?? ""

        navigationController?.pushViewController(detailController, animated: true)
    }
    
}


extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return Horoscope.horoscopes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        self.horoscope = Horoscope.userHoroscope(horoscope: Horoscope.horoscopes[row])
        print("\(Horoscope.userHoroscope(horoscope: Horoscope.horoscopes[row]))")
        
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Horoscope.horoscopes.count
        
    }
    
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.name = textField.text ?? ""
        textField.resignFirstResponder()
        return true
    }
}


