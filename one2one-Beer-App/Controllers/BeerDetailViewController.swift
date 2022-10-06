import Foundation
import UIKit

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var beerDetailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    var image = ""
    var name = ""
    var tag = ""
    var descriptionText = ""
    var abv: Double = 0
    var ibu: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
    }

    func setupDetailView() {
        let url = URL(string: image ) //TODO HELPER
        let data = try? Data(contentsOf: url!)
        beerDetailImageView.image = UIImage(data: data!)
        nameLabel.text =  name
        tabLabel.text =  tag
        descriptionTextView.text = descriptionText
        abvLabel.text = getGraduation(abv: abv) //TODO HELPER
        ibuLabel.text = getGraduation(ibu: ibu)
    }
    
    
    func getGraduation(abv: Double)-> String { //TODO HELPER
        if abv < 4.0 {
            return "ABU: \(String(format: "%.1f", abv))% 🟢"
        }
        if abv >= 4.0 && abv <= 9.0{
            return "ABU: \(String(format: "%.1f", abv))% 🟡"
        }
        if (abv > 9.0  && abv <= 15.0) {
            return "ABU: \(String(format: "%.1f", abv))% 🟠"
        }
        if abv > 15.0{
            return "ABU: \(String(format: "%.1f", abv))% 🔴"
        }else{
            return "ABU: \(String(format: "%.1f", abv))% ❔"
        }
    }
    
    func getGraduation(ibu: Double)-> String { //TODO HELPER
        if ibu < 10 {
            return "IBU: \(String(format: "%.1f", ibu)) 🟢"
        }
        if ibu >= 10 && ibu <= 20{
            return "IBU: \(String(format: "%.1f", ibu)) 🟡"
        }
        if (ibu > 20  && ibu <= 80) {
            return "IBU: \(String(format: "%.1f", ibu)) 🟠"
        }
        if ibu > 80{
            return "IBU: \(String(format: "%.1f", ibu)) 🔴"
        }else{
            return "ABU: \(String(format: "%.1f", ibu)) ❔"
        }
    }
    
}
