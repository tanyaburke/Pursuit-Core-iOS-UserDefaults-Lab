//
//  DetailViewController.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/16/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var horoscopeNameLabel: UILabel!
    
    @IBOutlet weak var horoscopeImage: UIImageView!
    @IBOutlet weak var horoscopeDetailsLabel: UILabel!
    
    var chosenHoroscope: String!
    var selectedSign = HoroscopeSign.init(sunsign: " ", horoscope: " ") {
        didSet{
            DispatchQueue.main.async {
                self.thing()
            }
        }
    }
    var name = UserPreferences.shared.getName()
    
//    var horoscopeText = HoroscopeSign?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        
        //  \(selectedSign.horoscope)
        
    }
    
    
    func loadData(){
        HoroscopeAPIClient.getHoroscope(horoscope: chosenHoroscope.lowercased()) {[weak self] (result) in
            switch result{
            case .failure(let appError):
                self?.showAlert(title: "Network Error", message: "\(appError)")
            case .success(let horoscopeSign):
                self?.selectedSign.horoscope = horoscopeSign.horoscope
                dump(self?.selectedSign.horoscope)
            }
        }
        
    }
    
    func thing(){
        self.horoscopeNameLabel.text = "\(self.chosenHoroscope.uppercased())"    //"\(selectedSign.sunsign)"
            self.horoscopeImage.image = UIImage(named: self.chosenHoroscope.lowercased())
        //"\(selectedSign.sunsign.lowercased())"
        
            self.horoscopeDetailsLabel.text = "Hi \(self.selectedSign.horoscope) \(self.selectedSign.horoscope)"
    }
}






