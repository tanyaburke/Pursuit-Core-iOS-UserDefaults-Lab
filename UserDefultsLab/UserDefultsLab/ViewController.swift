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
        @IBOutlet weak var horoscopeDataLabel: UILabel!
        @IBOutlet weak var outputNameLabel: UILabel!

        private var horoscopesOnlineList = [String]() {
            didSet {
                DispatchQueue.main.async {
                    self.horoscopePicker.selectRow(self.currentHoroscopeIndex ?? 2, inComponent: 0, animated: true)
                }
            }
        }
        private var horoscopeAllData = [HoroscopeSign]()

        private var currentHoroscopeIndex: Int? {
            didSet{
                //store data
                UserPreferences.shared.storeHoroscope(with: currentHoroscopeIndex ?? 2)
            }
        }
        var currentHoroscope = "all"

        private var name: String?{
            didSet{
                //update UI
                outputNameLabel.text! = "Name:\n\(name ?? "")"
                //store data
                UserPreferences.shared.storeName(with: name ?? "")
            }
        }

        private var horoscope: String?{
            didSet{
//                //update UI
//                outputNameLabel.text! = "Name:\n\(name ?? "")"
//                //store data
//                UserPreferences.shared.storeName(with: name ?? "")


            }
        }


        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            loadData()
            pickerViewDelegateOrDataSources()
            textViewDelegateOrDataSources()
            //currentHoroscope = horoscopesOnlineList.first
            horoscopeDataLabel.isHidden = true
        }

        func loadData(){
            HoroscopeAPIClient.getHoroscope(horoscope: currentHoroscope) { (result) in
                switch result{
                case .failure(let appError):
                    self.showAlert(title: "Network Error", message: "\(appError)")
                case .success(let horoscopeSigns):
                    self.horoscopesOnlineList = horoscopeSigns.map{$0.sunsign}
                    self.horoscopeAllData = horoscopeSigns
                }
            }

            //getting stored data
            if let storedName = UserPreferences.shared.getName(){
                name = storedName
            }

            if let storedHoroscope = UserPreferences.shared.getHoroscope(){
                currentHoroscope = storedHoroscope
            }
        }

        func pickerViewDelegateOrDataSources(){
            horoscopePicker.dataSource = self
            horoscopePicker.delegate = self
        }

        func textViewDelegateOrDataSources(){
            nameTextField.delegate = self
        }

        func labelUpdated(){
            name = nameTextField.text ?? ""
            //store name
            UserPreferences.shared.storeName(with: name ?? "")
            outputNameLabel.text! = "Name:\n\(name ?? "")"
        }
//
//        @IBAction func viewHoroscopeButton(_ sender: UIButton) {
//            let filteredData = horoscopeAllData.filter{$0.sunsign == currentHoroscope}.first!
//            //print(filteredData)
//            horoscopeDataLabel.isHidden = false
//            horoscopeDataLabel.text = "Horoscope:\n\(filteredData.horoscope)\nMood:\(filteredData.meta.mood)\nKeywords:\(filteredData.meta.keywords)"
//            UserPreferences.shared.storeHoroscope(with: currentHoroscopeIndex ?? 2)
//        }
    }


    extension ViewController: UIPickerViewDelegate{
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { 
            
            return Horoscope.horoscopes[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.currentHoroscope = Horoscope.horoscopes[row]
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

            labelUpdated()
            textField.resignFirstResponder()
            return true
        }
    }

