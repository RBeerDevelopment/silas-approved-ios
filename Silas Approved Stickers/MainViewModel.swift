//
//  MainViewModel.swift
//  Silas Approved Stickers
//
//  Created by Robin Beer on 31.10.21.
//

import Foundation


final class MainViewModel: NSObject, ObservableObject {
    @Published var stickers: [AllStickersQuery.Data.Sticker] = []
    
    override init() {
        super.init()
        loadStickers { newStickers in
            print("newStickers:", newStickers)
            self.stickers = newStickers
        }
    }
    
    func loadStickers(callback: @escaping ([AllStickersQuery.Data.Sticker]) -> ()) {
        GraphQLService.shared.apollo.fetch(query: AllStickersQuery()) { result in
            switch result {
              case .success(let graphQLResult):
                if let stickers = graphQLResult.data?.stickers.compactMap({ $0 }) {
                    callback(stickers)
                }
                
              case .failure(let error):
                print("Failure! Error: \(error)")
                callback([])
              }
        }
    }
}
