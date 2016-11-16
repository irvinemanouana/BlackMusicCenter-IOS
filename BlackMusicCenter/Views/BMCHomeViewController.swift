//
//  BMCHomeViewController.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 10/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import UIKit
import SwiftyJSON

class BMCHomeViewController: BMCDefaultViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellId:String = "BMCMusicCell"

    var musics: [BMCMusic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "player"

        self.initTableView();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BMCWebManager.shared.getMusicList().responseJSON { response in
            if let result = response.result.value {
                let jsonResult = JSON(result);
                for value in jsonResult["result"].array! {
                    self.musics.append(BMCMusicFactory.getMusicFromJSON(value.object as! [String : AnyObject]));
                }
                
                DispatchQueue.main.async(execute: { 
                    self.tableView.reloadData();
                })
            }
        }
    }
}

extension BMCHomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        let nib:UINib = UINib(nibName: "BMTableViewCell", bundle: nil);
        self.tableView.register(nib, forCellReuseIdentifier: cellId);
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musics.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BMTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BMTableViewCell;
        
        let music:BMCMusic = self.musics[indexPath.row];
        
        cell.title.text = music.title;
        
        return cell;
    }
    
}
