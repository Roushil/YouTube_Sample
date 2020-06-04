//
//  ViewController.swift
//  YouTube_Sample
//
//  Created by Roushil singla on 6/4/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var youTubeData: YouTubeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchYouTubeData()
    }

    func fetchYouTubeData(){
        
        Service.shared.getVideos { [weak self] (result) in
            guard let _self = self else { return }
            
            switch result {
                
            case .success(let video):
                _self.youTubeData = video
                // need thumbnail for high
                // need videoId from resourceId
                
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}



