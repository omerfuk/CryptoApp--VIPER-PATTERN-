//
//  Router.swift
//  CryptoApp -VIPER PATTERN-
//
//  Created by Ömer Faruk Kılıçaslan on 5.07.2022.
//

import Foundation
import UIKit


// Class, Protocol
// Entry Point should be determined on this Router Class

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    
    var entry : EntryPoint? {get}
    
    static func startExecution() -> AnyRouter
    
}


class CryptoRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view: AnyView = CryptoViewController()
        var presenter: AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
    
    
}
