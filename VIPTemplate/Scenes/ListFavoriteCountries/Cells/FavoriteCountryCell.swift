//
//  FavoriteCountryCell.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import UIKit

class FavoriteCountryCell: UICollectionViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var totalCasesLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    
    var country: Country = Country() {
        didSet {
            countryNameLabel.text = country.name
            newCasesLabel.text = String(country.totalConfirmedNewCases)
            totalCasesLabel.text = String(country.totalConfirmedCases)
            newDeathsLabel.text = String(country.totalNewDeaths)
            totalDeathsLabel.text = String(country.totalDeaths)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
