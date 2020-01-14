//
//  UserDefaults.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/14/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import Foundation

//
//enum UserSign:String{
//    case miles = "Miles"
//    case kilometers = "Kilometers"
//}
//enum UserInfo:String{
//    case name = ""
//    case birthday = ""
//}
//
//struct UserPreferenceKey {
//    
//  static let userSign = "Stored User Sign"
//  static let exerciseImage = "ImageName"
//}
//
//class UserPreference {
//    
//    //a Singleton initializer NEEDS to be pivate - this ensures that
//    //Only one instance of this classis used throughout the application
//    
//    private init(){}
//  
//    private let standard = UserDefaults.standard
//   
//    static let shared = UserPreference()
//    
//    //access functions through user pefrence.shared opnly
//    
//    func updateUnitMesurement(with unit: UnitMeasurement){
//        //storing or persisting unit measyrement value to user defaults(device simiulaar as permanent storage
//     //set a user defaults value object
//       
//       //UserDefaults.standard is a singelton in iOS that gives us access to
//        //saving and retreiving stired data in a device or simulator
//        UserDefaults.standard.set(unit.rawValue, forKey: UserPreferenceKey.unitMeasurement)
//        
//        //our key is unitmesurement our value is eithe miles or kilometers
//        //UseDefault["UnitMeasurement":"Kilometers"]
//    }
//    
//    func getUnitMeasurement()->UnitMeasurement?{
//        // retrieve a user defaults value object
//        guard let unitMeasurement = UserDefaults.standard.object(forKey: UserPreferenceKey.unitMeasurement) as? String else {
//            return nil
//        }
//        return UnitMeasurement(rawValue: unitMeasurement)
//    }
//   
//    func updateExerciseImage(with image: ImageName){
//        
//          //UserDefaults.standard is a singelton in iOS that gives us access to
//           //saving and retreiving stored data in a device or simulator
//        UserDefaults.standard.set(image.rawValue, forKey: UserPreferenceKey.exerciseImage)
//    
//}
//    
//    func getImageName()->ImageName?{
//           // retrieve a user defaults value object
//           guard let exerciseImage = UserDefaults.standard.object(forKey: UserPreferenceKey.exerciseImage) as? String else {
//               return nil
//           }
//           return ImageName(rawValue: exerciseImage)
//       }
//    
//    
//    
//}
