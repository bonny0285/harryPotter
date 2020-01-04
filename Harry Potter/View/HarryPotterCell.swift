//
//  HarryPotterCell.swift
//  Harry Potter
//
//  Created by Massimiliano on 04/01/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class HarryPotterCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    
  
    func setupTable(harryPotter: HarryPotterModel){
        nameLabel.text = "Name: \(harryPotter.name)"
        houseLabel.text = "House: \(harryPotter.house)"
        roleLabel.text = "Role: \(harryPotter.role)"
        schoolLabel.text = "School: \(harryPotter.school)"
        speciesLabel.text = "Species: \(harryPotter.species)"
    }

}
