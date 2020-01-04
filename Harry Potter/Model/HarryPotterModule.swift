//
//  HarryPotterModule.swift
//  Harry Potter
//
//  Created by Massimiliano on 03/01/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct HarryPotterModel {
    
    var house : String
    var name : String
    var role : String
    var school : String
    var species : String
    
    init(house: String, name: String, role: String, school: String, species: String) {
        self.house = house
        self.name = name
        self.role = role
        self.school = school
        self.species = species
    }
    
    
    static func getData(completion: @escaping ([HarryPotterModel]) -> (Void)){
        
        let apiKey = "$2a$10$aiWFgIEqzNzB9GB/8MCdmOMApkXkQkj5fJFTr7ncm3RzsBT4uWNWW"
        let url = "https://www.potterapi.com/v1/characters"
        let parameters = ["key": "\(apiKey)"]
        var harryPotterArray = [HarryPotterModel]()
        
        
        Alamofire.request(url, parameters: parameters).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json : JSON = JSON(value)
                
                var count = 0
                
                json.forEach({_ in
                    count += 1
                })
                
                
                for i in 0 ... 194 {
                    let name = json[i]["name"]
                    let role = json[i]["role"]
                    let house = json[i]["house"]
                    let school = json[i]["school"]
                    let species = json[i]["species"]
                    
                    let harryPotter = HarryPotterModel(house: "\(house)", name: "\(name)", role: "\(role)", school: "\(school)", species: "\(species)")
                    
                    harryPotterArray.append(harryPotter)
                }
                completion(harryPotterArray)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
