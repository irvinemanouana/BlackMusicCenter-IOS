//
//  BMCHomeViewController.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 10/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import UIKit
import SwiftyJSON

class BMCHomeViewController: BMCDefaultViewController, UITableViewDelegate, UITableViewDataSource {

    var shows : [String] = ["Luke Cage","Dardevil","Orange is the new Black","Narcos","Sens8","Strange Things","Sherlock","Jessica Jones", "Iron Fist"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "player"
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BMCWebManager.shared.getMusicList().responseJSON { response in
            if let result = response.result.value {
                let jsonResult = JSON(result);
                for value in jsonResult["result"].array! {
                    print("Music : \(value)");
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //<#code#>
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //<#code#>
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*let withIdentifier = "musicCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath) as! BMTableViewCell
        cell.musicTitle.text = shows[indexPath.row]stom*/
        let customCell = Bundle.main.loadNibNamed("BMTableViewCell", owner: self, options: nil)?.first as! BMTableViewCell
        customCell.title.text = "lol"
        return customCell
    }
    
}
