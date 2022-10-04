//
//  ApiManager.swift
//  one2one-Beer-App
//
//  Created by Marc  Teixidó Carrera on 3/10/22.
//

import Foundation

class ApiManager {
    public static let shared = ApiManager()
    
    func retrieveBeers(success:@escaping (([Beer])-> Void), fail: @escaping (()-> Void)) {
        ServiceManager.shared.callService(urlString: "https://api.punkapi.com/v2/beers") { (response: [Beer]) in //FALLA LA PETICIÓ MIRAR-ho BE
            success(response)
        } fail: {
            fail()
        }
    }
}
