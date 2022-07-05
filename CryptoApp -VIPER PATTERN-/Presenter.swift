//
//  Presenter.swift
//  CryptoApp -VIPER PATTERN-
//
//  Created by Ömer Faruk Kılıçaslan on 5.07.2022.
//

import Foundation


// Class, Protocol
// Talks to -> interactor, router, view

enum NetworkError: Error {
    
    case NetworkFailed
    case ParsingFailed
}


protocol AnyPresenter {
    
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) 
}

class CryptoPresenter : AnyPresenter {
    
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        
        switch result {
        case .success(let cryptos):
            //view.update
            print("update")
        case .failure(let error):
            //view.updateerror
            print("error")
        }
    }
    
    
    
}
