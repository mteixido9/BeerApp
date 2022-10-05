//
//  ApiManager.swift
//  one2one-Beer-App
//
//  Created by Marc  Teixidó Carrera on 3/10/22.
//

import Foundation

class BeerApiManager {
    public static let shared = BeerApiManager()
    var isFetchInProgress = false
    
    func retrieveBeers(success:@escaping (([Beer])-> Void), fail: @escaping (()-> Void)) {
        ServiceManager.shared.callService(urlString: "https://api.punkapi.com/v2/beers") {response in
            success(response)
        } fail: {
            fail()
        }
    }
    
    func getRandomBeer(success:@escaping (([Beer])-> Void), fail: @escaping (()-> Void)) {
        ServiceManager.shared.callService(urlString: "https://api.punkapi.com/v2/beers/random") {response in
            success(response)
        } fail: {
            fail()
        }
    }
    
    func getBeerFor(food:String, success:@escaping (([Beer])-> Void), fail: @escaping (()-> Void)) {
        let replacedFood = food.replacingOccurrences(of: " ", with: "_")
        ServiceManager.shared.callService(urlString: "https://api.punkapi.com/v2/beers?food=\(replacedFood)")
        {response in
            success(response)
        } fail: {
            fail()
        }
    }
}
