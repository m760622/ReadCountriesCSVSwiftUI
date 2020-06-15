//https://github.com/m760622
//  CountriesStruct.swift
//  ReadCountriesCSVSwiftUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-15.
//  Copyright © 2020 NMDS. All rights reserved.
//https://github.com/m760622/ReadCountriesCSVSwiftUI

import Foundation

struct CountriesStruct: Identifiable,Codable, Hashable {
    let id = UUID()
    var name: String
    var code: String
    var flag: String
    var region: String
    var selected: Bool
}//CountriesStruct

var countriesDB = [CountriesStruct]()

class CountriesClass {
    static let bundleURL =  Bundle.main.url(forResource: "countries", withExtension: "csv")!    
    static func retrieveCountries() -> [CountriesStruct] {
        guard let data = try? Data(contentsOf: bundleURL) else {
            fatalError("Unable to load country data")
        }
        let decoder = String(data: data, encoding: .utf8)
        if  let dataArr = decoder?.components(separatedBy: "\r\n").map({ $0.components(separatedBy: ";") })
        {
            var i = 0
            for line in dataArr
            {
                i += 1
                if i <  dataArr.count  {
                    let item = CountriesStruct(name: line[0], code: line[1], flag: line[2], region: line[3], selected: Bool(line[4])!)
                    countriesDB.append(item)
                }//if i
            }//for
        }
        return countriesDB
    }
}//CountriesClass

class CountriesViewModel: NSObject, ObservableObject {
    @Published var countries = [CountriesStruct]()
    override init() {
        countries = CountriesClass.retrieveCountries()
    }
}//CountriesViewModel

