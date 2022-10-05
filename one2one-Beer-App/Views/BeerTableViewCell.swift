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
    
    public func configureDailyWeatherCell(beerName: String?, beerTag: String?, abv: Double?, ibu:Double?, beerUrlImage: String?) {
        let url = URL(string: beerUrlImage ?? "")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        beerImageView.image = UIImage(data: data!)
        beerNameLabel.text = beerName ?? ""
        beerTagLabel.text =  beerTag ?? ""
        abvLabel.text = "ABU: \(String(format: "%1f", abv ?? 0))"
        abvLabel.text = "IBU: \(String(format: "%1f", ibu ?? 0))"
    }

}
