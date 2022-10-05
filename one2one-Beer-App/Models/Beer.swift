
import Foundation

struct Beer: Decodable {
    let name: String?
    let tagline: String?
    let description: String?
    let imageUrl: String?
    let abv: Double?
    let ibu: Double?
    let foodPairing: [String]?
    
    public init( name: String?, tagline: String?,description: String?, imageUrl: String?, abv: Double?, ibu: Double?,foodPairing: [String]?){
        self.name = name
        self.tagline = tagline
        self.description = description
        self.imageUrl = imageUrl
        self.abv = abv
        self.ibu = ibu
        self.foodPairing = foodPairing
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case tagline
        case description
        case imageUrl = "image_url"
        case abv
        case ibu
        case foodPairing = "food_pairing"
    }
}
