import Foundation

class ServiceManager {
    
    public static let shared = ServiceManager()
    
    func callService<T: Decodable>(urlString: String, success:@escaping ((T)-> Void), fail:@escaping(()->Void)){
        let url = URL(string: urlString)
        guard let urlObj = url else{ return }
        var request = URLRequest(url: urlObj)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: urlObj) { data, response, error in
            guard error == nil, let data = data else { return }
            print(data)
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                success(response)
            }catch  let error {
                print("Failed to decode object...",error)
            }
        }.resume()
    }
}
