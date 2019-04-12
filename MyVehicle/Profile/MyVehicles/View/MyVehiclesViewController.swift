//
//  MyVehiclesViewController.swift
//  MyVehicle
//
//  Created by Александр Арсенюк on 18/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class MyVehiclesViewController: UIViewController, MyVehiclesViewInput, UITableViewDelegate, UITableViewDataSource {
 
    
    var presenter: MyVehiclesViewOutput!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.obtainCountOfCars()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let models = presenter.obtainCars()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VehicleTableViewCell
        let currentCar = models[indexPath.row]
        cell.configureCell(label: currentCar.label,
                           model: currentCar.model,
                           year: currentCar.year)
        return cell
    }
    
    func  tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
