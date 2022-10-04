//
//  ViewController.swift
//  one2one-Beer-App
//
//  Created by Marc  Teixidó Carrera on 1/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    
    
    let beersViewModel = BeersViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        startService()
        setupUI()
    }
    
    private func startService(){
        beersViewModel.callService()
    }
    
    
    private func setupUI() {
        self.tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: "BeerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beersViewModel.numberOrRows() 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beerCell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerTableViewCell
        return beerCell
    }

}

