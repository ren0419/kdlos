//
//  Bundle+.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fatal Error")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load  \(file) from Bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle.")
        }
        
        return loaded
    }
    
    func decodeOrNull<T: Codable>(_ file: String) -> T? {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        
        return loaded
    }
}
