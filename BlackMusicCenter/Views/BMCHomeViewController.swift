//
//  BMCHomeViewController.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 10/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import UIKit

class BMCHomeViewController: BMCDefaultViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var musicTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "player"
        // Do any additional setup after loading the view.
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //<#code#>
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //<#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let withIdentifier = "musicCell"
        let cell = musicTable.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath) as! BMTableViewCell
        return cell
    }
    
}
