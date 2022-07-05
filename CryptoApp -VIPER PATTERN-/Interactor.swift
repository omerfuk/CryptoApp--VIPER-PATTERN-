//
//  Interactor.swift
//  CryptoApp -VIPER PATTERN-
//
//  Created by Ömer Faruk Kılıçaslan on 5.07.2022.
//

import Foundation

// Class, Protocol,
// Talks to -> Presenter


protocol AnyInteractor {
    
    var presenter: AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        
        guard let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=b760370c98bdc091cc18193a60b69598e3d12ae1") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data, error == nil else{
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
                
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch  {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
            

        }
        task.resume()
        
    }
    
   
    
    
    
}
