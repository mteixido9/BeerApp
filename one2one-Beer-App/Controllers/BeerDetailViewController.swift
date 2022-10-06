import Foundation
import UIKit

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var beerDetailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!

    func setupDetailView(beerName: String?, beerTag: String?, abv: Double?, ibu:Double?, beerUrlImage: String?, beerDescription: String?) {
        let url = URL(string: beerUrlImage ?? "") //TODO HELPER
        let data = try? Data(contentsOf: url!)
        beerDetailImageView.image = UIImage(data: data!)
        nameLabel.text =  beerName ?? ""
        tabLabel.text =  beerTag ?? ""
        descriptionTextView.text = beerDescription ?? ""
        abvLabel.text = "ABU: \(String(format: "%.1f", abv ?? 0))"
        ibuLabel.text = "IBU: \(String(format: "%.1f", ibu ?? 0))"
    }
    
}
