//https://github.com/m760622
//  ContentView.swift
//  ReadCountriesCSVSwiftUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-15.
//  Copyright © 2020 NMDS. All rights reserved.
// https://github.com/m760622/ReadCountriesCSVSwiftUI

import SwiftUI

struct ContentView: View {
    @ObservedObject var countriesVM:CountriesViewModel = CountriesViewModel()
    var body: some View {
        let countriesDB = countriesVM.countries
        return NavigationView {
            List(countriesDB, id:\.self) { country in
                Text("\(country.flag)").font(.largeTitle)
                    .clipShape(Circle())
                Text("\(country.name)").font(.title)
            }//List
                .id(UUID())
                .navigationBarTitle("Countries and flags")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }//body
}//ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([
            ColorScheme.light,
            ColorScheme.dark
        ], id :\.self) { scheme in
            ContentView()
                .colorScheme(scheme)
        }
        
    }
}



