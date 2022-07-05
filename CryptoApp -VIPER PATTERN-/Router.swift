//
//  Router.swift
//  CryptoApp -VIPER PATTERN-
//
//  Created by Ömer Faruk Kılıçaslan on 5.07.2022.
//

import Foundation


// Class, Protocol
// Entry Point should be determined on this Router Class

protocol AnyRouter {
    
    static func startExecution() -> AnyRouter
    
}


class CryptoRouter: AnyRouter {
    
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        return router
    }
    
    
    
    
}
