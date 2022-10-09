import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate, UIScrollViewDelegate {
    
    let beersViewModel = BeersViewModel()
    var timer: Timer? = nil
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var randomBeerButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startService()
        setDelegates()
    }
    
    private func startService(){
        activityIndicator.startAnimating()
        beersViewModel.retrieveBeers {
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
                activityIndicator.stopAnimating()
            }
        }
    }
    
    private func setDelegates() {
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    @IBAction func onRandomBeerPressed(_ sender: Any) {
        randomBeerButton.isUserInteractionEnabled = false
        beersViewModel.getRandomBeer { [self] in
            DispatchQueue.main.async{
                if let detailVc = storyboard?.instantiateViewController(withIdentifier: "BeerDetailViewController") as? BeerDetailViewController{
                    guard let randomBeer = beersViewModel.randomBeer else { return  }
                    detailVc.image = randomBeer.imageUrl ?? ""
                    detailVc.name = randomBeer.name ?? ""
                    detailVc.tag = randomBeer.tagline ?? ""
                    detailVc.descriptionText = randomBeer.description ?? ""
                    detailVc.abv = randomBeer.abv ?? 0
                    detailVc.ibu = randomBeer.ibu ?? 0
                    self.navigationController?.pushViewController(detailVc, animated: true)
                    randomBeerButton.isUserInteractionEnabled = true
                }
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beersViewModel.numberOrRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beerCell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerTableViewCell
        guard let beerList = beersViewModel.beerList else { return beerCell }
        DispatchQueue.main.async {
            beerCell.configureBeerCell(beerName: beerList[indexPath.row].name, beerTag: beerList[indexPath.row].tagline, abv: beerList[indexPath.row].abv, ibu: beerList[indexPath.row].ibu, beerUrlImage: beerList[indexPath.row].imageUrl)
        }
        return beerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVc = storyboard?.instantiateViewController(withIdentifier: "BeerDetailViewController") as? BeerDetailViewController{
            guard let beerList = beersViewModel.beerList else { return  }
            detailVc.image = beerList[indexPath.row].imageUrl ?? ""
            detailVc.name = beerList[indexPath.row].name ?? ""
            detailVc.tag = beerList[indexPath.row].tagline ?? ""
            detailVc.descriptionText = beerList[indexPath.row].description ?? ""
            detailVc.abv = beerList[indexPath.row].abv ?? 0
            detailVc.ibu = beerList[indexPath.row].ibu ?? 0
            detailVc.matchingFood = beerList[indexPath.row].foodPairing?.joined(separator: ", ") ?? ""
            self.navigationController?.pushViewController(detailVc, animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""  { return }
        if searchText.count >= 3 {
            if timer != nil {
                timer?.invalidate()
            }
            timer = Timer.scheduledTimer(withTimeInterval: 0.420, repeats: false) { [self] timer in
                activityIndicator.startAnimating()
                beersViewModel.retrieveBeersBy(foodName: searchText) {
                    DispatchQueue.main.async { [self] in
                        tableView.reloadData()
                        activityIndicator.stopAnimating()
                        timer.invalidate()
                    }
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height-100-scrollView.frame.size.height{
            activityIndicator.startAnimating()
            beersViewModel.retrieveBeers(pagination: true, page: beersViewModel.beerListPage) {
                DispatchQueue.main.async { [self] in
                    tableView.reloadData()
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
}

