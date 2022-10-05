import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate{
 
    let beersViewModel = BeersViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        startService()
        setDelegates()
    }
    
    private func startService(){
        beersViewModel.retrieveBeers { [self] in
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    
    private func setDelegates() {
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beersViewModel.numberOrRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beerCell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerTableViewCell
        guard let beerList = beersViewModel.beerList else { return beerCell }
        DispatchQueue.main.async {
            beerCell.configureDailyWeatherCell(beerName: beerList[indexPath.row].name, beerTag: beerList[indexPath.row].tagline, abv: beerList[indexPath.row].abv, ibu: beerList[indexPath.row].ibu, beerUrlImage: beerList[indexPath.row].imageUrl)
        }
        return beerCell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""  { return }
        if searchText.count >= 3{
            beersViewModel.retrieveBeersBy(foodName: searchText) {
                DispatchQueue.main.async { [self] in
                    tableView.reloadData()
                }
            }
        }
    }
}

