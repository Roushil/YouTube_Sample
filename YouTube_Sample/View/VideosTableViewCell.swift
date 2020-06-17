//
//  VideosTableViewCell.swift
//  YouTube_Sample
//
//  Created by Roushil singla on 6/11/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var items: Items?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: Items) {
        
        self.items = item
        guard let snippet = items?.snippet else { return }
        
        titleLabel.text = snippet.title
        getDate(snippet.publishedAt)
        guard let imageUrl = snippet.thumbnails?.high?.url else { return }
        getImage(imageUrl)
        
    }
    
    
    func getDate(_ dateString: String?) {
        
        // Getting date from string
        guard let stringDate = dateString else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: stringDate)
        // Getting string from date
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let finalDate = dateFormatter.string(from: date!)
        DispatchQueue.main.async {
            self.dateLabel.text = finalDate
        }
    }
    
    func getImage(_ urlString: String) {
        guard let url = URL(string: urlString)else { return }
        let data = try! Data(contentsOf: url)
        DispatchQueue.main.async {
            self.thumbnailImage.image = UIImage(data: data)
        }
    }
}
