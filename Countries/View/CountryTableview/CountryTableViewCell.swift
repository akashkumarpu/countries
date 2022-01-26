//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by MAC on 25/01/22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    
    func configure(item: Country) {
        guard let name = item.name, let curr = item.currencies?[0].name else { return  }
        
        countryLabel.text = name
        currencyLabel.text = "Currency: \(curr)"
        
        guard let population = item.population else { return }
        
        populationLabel.text = "Population: \(population)"
    }
    
}
