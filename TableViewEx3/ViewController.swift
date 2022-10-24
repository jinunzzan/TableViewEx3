//
//  ViewController.swift
//  TableViewEx3
//
//  Created by Eunchan Kim on 2022/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let flags = ["ec", "sn", "nl", "qa", "gb-wls", "ir", "us", "gb-eng", "sa", "pl", "mx", "ar", "au", "tn", "dk", "fr", "cr", "jp", "de", "es", "ca", "ma", "hr", "be", "cm", "rs", "ch", "br", "gh", "kr", "uy", "pt"]

    let countries = ["Ecuador", "Senegal", "Netherlands", "Qatar", "Wales", "Iran", "USA", "England", "Saudi Arabia", "Poland", "Mexico", "Argentina", "Australia", "Tunisia", "Denmark", "France", "Costa Rica", "Japan", "Germany", "Spain", "Canada", "Morocco", "Croatia", "Belgium", "Cameroon", "Serbia", "Switzerland", "Brazil", "Ghana", "South Korea", "Uruguay", "Portugal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = countries[indexPath.row]
        content.textProperties.font = .systemFont(ofSize: 25, weight: .heavy)
        
        content.image = UIImage(named: flags[indexPath.row])
        content.imageProperties.maximumSize.width = 120
        content.imageProperties.maximumSize.height = 80
        
        content.secondaryText = "Qatar2022"
        content.secondaryTextProperties.color = .red
        
        cell.contentConfiguration = content
        
        if indexPath.row % 2 == 0 {
            cell.accessoryView = UIImageView(image: UIImage(named: "steamed"))
        } else {
            cell.accessoryView = UIImageView(image: UIImage(named: "steamed_on"))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        label.text = countries[indexPath.row]
    }
    
}
extension ViewController:UITableViewDelegate{
    
}
