import Foundation

class BeersViewModel {
    var beersLoaded: (([Beer]?, Bool) -> Void)?
    var beerList: [Beer]?
    var randomBeer: Beer?
    var beerListPage: Int = 1
    
    func retrieveBeers(pagination: Bool = false, page: Int? = nil, _ completionHandler:@escaping (()-> Void)) {
        BeerApiManager.shared.retrieveBeers(page: page, success: { response in
            if(pagination){
                DispatchQueue.main.async {
                    self.beerList?.append(contentsOf: response)
                    self.handleResponse(response: response, success: true)
                    self.beerListPage+=1
                    completionHandler()
                }
                return
            }
            self.beerList = response
            self.handleResponse(response: response, success: true)
            completionHandler()
        }, fail: { [weak self] in
            self?.handleResponse(response: nil, success: false)
            
        })
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
    
    func getRandomBeer(_ completionHandler:@escaping (()-> Void)){
        BeerApiManager.shared.getRandomBeer(success: { [weak self] response in
            self?.randomBeer = response.first
            self?.handleResponse(response: response, success: true)
            completionHandler()
        }, fail: { [weak self] in
            self?.handleResponse(response: nil, success: false)
        })
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
