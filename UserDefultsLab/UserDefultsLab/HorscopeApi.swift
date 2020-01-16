//
//  HorscopeApi.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/14/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import Foundation


struct HoroscopeAPIClient {
    static func getHoroscope (horoscope: String, completion: @escaping (Result<[HoroscopeSign], AppError>)->()){
        let endPointUrl = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today"
        guard let url = URL(string: endPointUrl) else {
            completion(.failure(.badURL(endPointUrl)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                    let horoscopes = try  JSONDecoder().decode([HoroscopeSign].self, from: data)
                    completion(.success(horoscopes))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}


//func setHoroscope()-> String{
  
//    switch UserPreferences.birthdaay
//    
//    case Date(March 21 – April 19): 
//    Aries dates
//    Taurus dates: April 20\(year) – May 20\(year)
    
//    Gemini dates: May 21 – June 20
//    Cancer dates: June 21 – July 22
//    Leo dates: July 22 – August 22
//    Virgo dates: August 23 – September 22
//    Libra dates: September 23 – October 22
//    Scorpio dates: October 23 – November 21
//    Sagittarius dates: November 22 – December 21
//    Capricorn dates: December 22 – January 19
//    Aquarius dates: January 20 – February 18
//    Pisces dates:February 19 – March 20
//    
    
//    UserPreferences.birthday
    
//    let startDate = Date().addingTimeInterval(-1000)
//    let endDate = Date().addingTimeInterval(1000)
//    let dateRange = startDate...endDate
//    if dateRange.contains(testDate) {
//        print("Inside the range")
//    }

