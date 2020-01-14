//
//  SettingsViewController.swift
//  UserDefaults
//
//  Created by Tanya Burke on 1/13/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit


class SettingsViewController: UITableViewController {

    @IBOutlet weak var unitMeasurementLabel: UILabel!
    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    var currentImage = ImageName.run{
        didSet{
            exerciseImage.image = UIImage(named: currentImage.rawValue)
            UserPreference.shared.updateExerciseImage(with: currentImage)
        }
    }
    
    var currentUnit = UnitMeasurement.miles {
              didSet {
                  // update the unitMeasurement label
                unitMeasurementLabel.text = currentUnit.rawValue //miles or kilometers
                  
                
                //update value in user default
                UserPreference.shared.updateUnitMesurement(with: currentUnit)
              }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
      
        }
    private func updateUI(){
        //retreive any values in user defaults
        if let unitMeasurement = UserPreference.shared.getUnitMeasurement(){
            currentUnit = unitMeasurement
        }
        if let updateImage = UserPreference.shared.getImageName(){
            currentImage = updateImage
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //toggle between miles and kilometer
        switch indexPath.row {
        case 0:
            //toggle unot measurement label
            toggleUnitMeasurement()
        case 1:
            toggleImageName()
        default:
            break
        }
    }
    
    private func toggleUnitMeasurement(){
        currentUnit = (currentUnit == UnitMeasurement.miles) ? UnitMeasurement.kilometers : UnitMeasurement.miles
    }
    
    private func toggleImageName(){
        currentImage = (currentImage == ImageName.bike) ? ImageName.run : ImageName.bike
    }

}
