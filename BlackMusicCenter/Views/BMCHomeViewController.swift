//
//  BMCHomeViewController.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 10/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import UIKit
import SwiftyJSON
import AVFoundation

class BMCHomeViewController: BMCDefaultViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var player:AVAudioPlayer?
    
    private let musicWeb: BMCWebManager = BMCWebManager.shared;
    
    @IBOutlet weak var musicArtistLabel: UILabel!
    @IBOutlet weak var musicTitleLabel: UILabel!
    let cellId:String = "BMCMusicCell"
    
    var musics: [BMCMusic] = []
    var currentSong : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.initTableView();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
       
        self.musicWeb.getMusicList().responseJSON { response in
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
    
    func downloadMusic(_ music: BMCMusic) {
        self.musicWeb.downloadMusic(music)
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                switch response.result {
                case .success(let data):
                    print("Sucess Receive Data");
                    DispatchQueue.main.async(execute: {
                        self.playSound(data: data);
                        self.musicTitleLabel.text = music.title;
                        self.musicArtistLabel.text = music.artist;
                    })
                case .failure:
                    print("Fail \(response)");
                }
        }
    }

    @IBAction func nextButton(_ sender: Any) {
        nextMusic()
    }
    
    @IBAction func playButton(_ sender: Any) {
       lauchMusic()
    }

    @IBAction func previewsButton(_ sender: Any) {
        previewMusic()
    }
    func playSound(data: Data) {
        if let player = try? AVAudioPlayer(data: data) {
            player.play();
            player.numberOfLoops = 1;
            player.currentTime = 10;
            self.player  = player;
        }
    }
    
    func lauchMusic()  {
        
        let music:BMCMusic = self.musics[0];
        currentSong = 0
        self.downloadMusic(music);
    }
    func nextMusic()  {
        let music:BMCMusic = self.musics[currentSong+1];
        currentSong = currentSong+1
        self.downloadMusic(music);
    }
    func previewMusic() {
        
        let music:BMCMusic = self.musics[currentSong-1];
        currentSong = currentSong-1
        self.downloadMusic(music);
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
        //cell.artistLabel.text = music.artist;
        if let url = URL(string: music.thumbnail) {
            do {
                let data = try Data(contentsOf: url);
                cell.musicImage.image = UIImage(data: data);
                cell.artistLabel.text = music.artist;
                cell.genreLabel.text = music.genre;
            }
            catch {
                print(error.localizedDescription);
            }
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let music:BMCMusic = self.musics[indexPath.row];
        currentSong = indexPath.row
        self.downloadMusic(music);
    }
}
