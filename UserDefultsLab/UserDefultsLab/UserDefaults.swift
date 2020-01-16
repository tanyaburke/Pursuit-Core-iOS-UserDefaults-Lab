//
//  UserDefaults.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/14/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import Foundation

import Foundation

struct UserPrefenceKey {
    static let name = "Name"
    static let horoscopes = "Horoscopes"
    static let birthday = "Birthday"
}

class UserPreferences{
    
    private init(){}
    private let standard = UserDefaults.standard
    static let shared = UserPreferences()
    
    func storeName(with name: String){
        standard.set(name, forKey: UserPrefenceKey.name)
    }
    
    func getName() -> String?{
        guard let name = standard.value(forKey: UserPrefenceKey.name) as? String else { return nil }
        return name
    }
    
    func storeHoroscope (with horoscope: String) {
        standard.set(horoscope, forKey: UserPrefenceKey.horoscopes)
    }
    
    func getHoroscope() -> String? {
        guard let horoscope = standard.value(forKey: UserPrefenceKey.horoscopes) as? String else { return nil }
        return horoscope
    }
}
