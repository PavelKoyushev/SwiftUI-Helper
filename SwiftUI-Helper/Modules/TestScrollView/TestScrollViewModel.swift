//
//  TestScrollViewModel.swift
//  SwiftUI-Helper
//
//  Created by Pavel Koyushev on 21.10.2024.
//

import Foundation

@MainActor
final class TestScrollViewModel: ObservableObject {
    
    @Published var paginationState: ScrollPaginationState = .initial
    
    var page = 0
    var limit = 10
    
    @Published var array = Array(1...31)
    
    @Published var model: [Int] = []
    
    deinit {
        print("\(Self.self) deinited")
    }
}

extension TestScrollViewModel {
    
    func getCells() {
        
        let data = array.prefix(limit)
        
        model = Array(data)
        
        if data.count >= limit {
            paginationState = .pagination
        }
    }
    
    func getNextPage() {
        guard paginationState == .pagination else { return }
        
        paginationState = .loader
        page += 1
        
        Task {
            let startIndex = page * limit
            let endIndex = min(startIndex + limit, array.count)
            
            try? await Task.sleep(for: .seconds(2))
            
            let data = Array(array[startIndex..<endIndex])
            
            if data.isEmpty {
                paginationState = .initial
            } else {
                model += Array(data)
                
                if data.count < limit {
                    paginationState = .initial
                } else {
                    paginationState = .pagination
                }
            }
        }
    }
}
