import Foundation

class BeerApiManager {
    public static let shared = BeerApiManager()
    
    func retrieveBeers(page: Int? = nil, success:@escaping (([Beer])-> Void), fail: @escaping (()-> Void)) {
        ServiceManager.shared.callService(urlString: "https://api.punkapi.com/v2/beers?page=\(page ?? 1)") {response in
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
