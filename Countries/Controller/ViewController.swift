//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 22/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [Country]()
    let urlString =  "https://cdn.jsdelivr.net/gh/apilayer/restcountries@3dc0fb110cd97bce9ddf27b3e8e1f7fbe115dc3c/src/main/resources/countriesV2.json"
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loadCountries()
        
    }
    
    func loadCountries() {
        
        guard let url = URL(string: urlString) else { return }
        let sharedSession = URLSession.shared
        let request = URLRequest(url: url)
        
        let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                do {
                    self.countries = try JSONDecoder().decode([Country].self, from: data)
                    print(self.countries[100])
                    DispatchQueue.main.async {
                        self.countriesTableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
        })
        
        dataTask.resume()
    }
    
    
}


//MAK:- UITableViewExensin

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        
        let country = countries[indexPath.row]
        
        cell.configure(item: country)
        
        return cell
    }
    
    
}

