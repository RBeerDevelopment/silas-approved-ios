//
//  MainView.swift
//  Silas Approved Stickers
//
//  Created by Robin Beer on 30.10.21.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State private var isSignInRequired = false
    @State private var token = ""
    
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            MapView(stickers: $viewModel.stickers)
            .navigationTitle("Silas Approved")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {} ) {
                        Image(systemName: "plus")
                    }

                    Button(action: {} ) {
                        Image(systemName: "person")
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $isSignInRequired) {
            SignInView()
        }.onAppear(perform: {
            let _ = checkForToken()
                
        })
    }
    
    func checkForToken() -> Bool {
        let userDefaults = UserDefaults.standard
        let token = userDefaults.string(forKey: UserDefaultsKeys.TOKEN.rawValue)
        if(token != nil) {
            isSignInRequired = false
            self.token = token!
            return true
        } else {
            isSignInRequired = true
            return false
        }
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
