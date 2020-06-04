//
//  Service.swift
//  YouTube_Sample
//
//  Created by Roushil singla on 6/4/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class Service {
    
    static let shared = Service()
    
    func getVideos(completion: @escaping (Result<YouTubeModel, Error>) -> ()){
        
        let Url = URL(string: K.API_URL)
        guard let url = Url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let values = try decoder.decode(YouTubeModel.self, from: data!)
                completion(.success(values))
            }
            catch(let error) {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
