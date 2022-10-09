import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerTagLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    public func configureBeerCell(beerName: String?, beerTag: String?, abv: Double?, ibu:Double?, beerUrlImage: String?) {
        let url = URL(string: beerUrlImage ?? "")
        beerImageView.kf.setImage(with:url )
        beerNameLabel.text = beerName ?? ""
        beerTagLabel.text =  beerTag ?? ""
        abvLabel.text = Helper.app.getGraduation(abv: abv ?? 0)
        ibuLabel.text = Helper.app.getGraduation(ibu: ibu ?? 0)
    }

}
