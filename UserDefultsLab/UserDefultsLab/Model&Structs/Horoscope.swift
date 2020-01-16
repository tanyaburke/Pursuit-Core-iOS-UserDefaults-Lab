//
//  Horoscope.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/16/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import Foundation

struct Horoscope{
    static let horoscopes = ["Please select a horoscope","Aries, March 21 – April 20","Taurus, April 21 – May 20","Gemini, May 22 – June 21","Cancer, June 22 – July 23","Leo, July 23 – August 23","Virgo, August 24 – September 22","Libra, September 23 – October 23","Sagittarius, November 23 – December 22","Scorpio, October 24 – November 22","Capricorn, December 22 – January 20","Aquarius, January 21 – February 18","Pisces, February 19 – March 20"]
  
    
    static func userHoroscope(horoscope: String)-> String{
         
        let urHoroscope =  horoscope.components(separatedBy: ",")
      
        return urHoroscope[0].lowercased()
    }
    
}
