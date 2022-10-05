import Foundation

class BeersViewModel {
    var beersLoaded: (([Beer]?, Bool) -> Void)?
    var beerList: [Beer]?

    func retrieveBeers(_ completionHandler:@escaping (()-> Void)) {
        BeerApiManager.shared.retrieveBeers{ [weak self] response in
            self?.beerList = response
            self?.handleResponse(response: response, success: true)
            completionHandler()
        } fail: { [weak self] in
            self?.handleResponse(response: nil, success: false)
        }
    }
    
    func retrieveBeersBy(foodName: String, _ completionHandler:@escaping (()-> Void)){
        BeerApiManager.shared.getBeerFor(food: foodName) { [weak self] response in
            self?.beerList = response
            self?.handleResponse(response: response, success: true)
            completionHandler()
        } fail: { [weak self] in
            self?.handleResponse(response: nil, success: false)
        }
    }

    private func handleResponse(response: [Beer]?, success: Bool) {
        if let beersLoaded = self.beersLoaded {
            beersLoaded(response, success)
        }
    }

    func numberOrRows() -> Int {
        return self.beerList?.count ?? 0
    }

    func getBeer(index: Int) -> Beer? {
        return self.beerList?[index]
    }
}
