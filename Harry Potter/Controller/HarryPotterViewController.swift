//
//  ViewController.swift
//  Harry Potter
//
//  Created by Massimiliano on 03/01/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class HarryPotterViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var harryPotterArray = [HarryPotterModel]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        HarryPotterModel.getData(completion: {
            self.harryPotterArray = $0
            self.tableView.reloadData()
            print(self.harryPotterArray.count)
        })
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource

extension HarryPotterViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return harryPotterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "harryPotter", for: indexPath) as! HarryPotterCell
        
        cell.setupTable(harryPotter: harryPotterArray[indexPath.row])
        
        return cell
    }
}
