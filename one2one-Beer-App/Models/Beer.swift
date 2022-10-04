
import Foundation

struct Beer: Decodable {
    let name: String
    let tagline: String
    let description: String
    let image_url: String
    let abv: Double
    let ibu: Double
    let foodPairing: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case tagline
        case description
        case image_url
        case abv
        case ibu
        case foodPairing = "food_pairing"
    }
}
