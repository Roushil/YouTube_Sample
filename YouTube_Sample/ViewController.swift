//
//  ViewController.swift
//  YouTube_Sample
//
//  Created by Roushil singla on 6/4/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var youTubeData: [Items]?
    @IBOutlet weak var videosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videosTableView.register(UINib(nibName: "VideosTableViewCell", bundle: nil), forCellReuseIdentifier: "VideosTableViewCell")
        fetchYouTubeData()
    }

    func fetchYouTubeData(){
        
        Service.shared.getVideos { [weak self] (result) in
            guard let _self = self else { return }
            
            switch result {
                
            case .success(let video):
                _self.youTubeData = video.items
                
                DispatchQueueHelper.delay(bySeconds: 0.1, dispatchLevel: .main) {
                    _self.videosTableView.reloadData()
                }
                
                // need thumbnail for high
                // need videoId from resourceId
                
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youTubeData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = videosTableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath)
        
        return cell
    }
    
}


