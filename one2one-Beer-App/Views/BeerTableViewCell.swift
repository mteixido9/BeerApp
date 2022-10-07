//
//  BeerTableViewCell.swift
//  one2one-Beer-App
//
//  Created by Marc  Teixidó Carrera on 5/10/22.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerTagLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    public func configureBeerCell(beerName: String?, beerTag: String?, abv: Double?, ibu:Double?, beerUrlImage: String?) {
        let url = URL(string: beerUrlImage ?? "") //TODO HELPER URL
        let data = try? Data(contentsOf: url!)
        beerImageView.image = UIImage(data: data!)
        beerNameLabel.text = beerName ?? ""
        beerTagLabel.text =  beerTag ?? ""
        abvLabel.text = Helper.app.getGraduation(abv: abv ?? 0)
        ibuLabel.text = Helper.app.getGraduation(ibu: ibu ?? 0)
    }

}
