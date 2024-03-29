import Foundation
import UIKit
import Kingfisher

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var beerDetailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var foodPairingLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    var image = ""
    var name = ""
    var tag = ""
    var descriptionText = ""
    var abv: Double = 0
    var ibu: Double = 0
    var matchingFood = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
    }

    func setupDetailView() {
        let url = URL(string: image )
        if url != nil {
            beerDetailImageView.kf.setImage(with: url)
        }
        nameLabel.text =  name
        tabLabel.text =  tag
        descriptionLabel.text = descriptionText
        abvLabel.text = Helper.app.getGraduation(abv: abv)
        ibuLabel.text = Helper.app.getGraduation(ibu: ibu)
        foodPairingLabel.text = "Matching food: \(matchingFood)"
    }
}
