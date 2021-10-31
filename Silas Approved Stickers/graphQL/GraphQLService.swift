//
//  GraphQLService.swift
//  Silas Approved Stickers
//
//  Created by Robin Beer on 31.10.21.
//

import Foundation
import Apollo

class GraphQLService {
    static let shared = GraphQLService()
    
    private let apiUrl: String
    
    private init() {
        apiUrl = (Bundle.main.infoDictionary?["API_URL"] as? String)!
    }
    private(set) lazy var apollo = ApolloClient(url: URL(string: apiUrl)!)
}
