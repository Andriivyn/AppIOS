//
//  PostTableViewCell.swift
//  Vynnyk06
//
//  Created by Andrii Vynnyk on 15.11.2020.
//  Copyright © 2020 Andrii Vynnyk. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nicknameLabel: UILabel!
       @IBOutlet private weak var postTitle: UITextField!
       @IBOutlet private weak var timeLabel: UILabel!
       @IBOutlet private weak var domainLabel: UILabel!
       @IBOutlet private weak var rating: UILabel!
       @IBOutlet  weak var postImage: UIImageView!
       @IBOutlet private weak var mainView: UIView!
       @IBOutlet private weak var filledBookmark: UIImageView!
       @IBOutlet private weak var bookmark: UIImageView!
       @IBOutlet private weak var numComents: UILabel!
    
    // MARK: - Reuse Identifier
    static let reuseIdentifier = "postCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeRequest(limit: 5, index : 4)
    }
          
    func makeRequest(limit : Int, index : Int){
//        URLSession.shared.dataTask(with: URL(string:"https://www.reddit.com/r/ios/top.json?limit=\(limit)")!){
//                    data, response , error in
//                    if let dataResponse = data  {
//                        do{
//                        let decoder = JSONDecoder()
//                            let d = try? decoder.decode(Welcome.self, from: dataResponse)
//
//                            print(d!.data.children[index].data.author)
//
//                         DispatchQueue.main.async {
//                             self.nicknameLabel.text = d!.data.children[index].data.author
//                             self.nicknameLabel.isHidden = false;
//
//                             self.timeLabel.isHidden = false;
//
//                             self.domainLabel.isHidden = false;
//                             self.domainLabel.text = d!.data.children[index].data.domain
//
//                             self.postTitle.isHidden = false;
//                             self.postTitle.text = d!.data.children[index].data.title
//
//                             self.rating.isHidden = false;
//                             self.rating.text = "\(d!.data.children[index].data.ups + d!.data.children[index].data.downs)"
//
//                             self.numComents.isHidden = false;
//                             self.numComents.text = "\(d!.data.children[index].data.numComments)"
//
//                            self.postImage.load(url: URL(string: "\(d!.data.children[index].data.url)")!)
//
//                             if (d!.data.children[index].data.saved == true) {
//                                 self.filledBookmark.isHidden = false;
//                             }
//                             else {
//                                 self.bookmark.isHidden = false;
//                             }
//        //
//                             let currTime = Int(NSDate().timeIntervalSince1970)
//        //
//                            let timeDiff = currTime - d!.data.children[index].data.createdUtc
//
//                             var timePassed: String
//
//                             switch timeDiff {
//                             case let td where td < 60:
//                                 timePassed = "now";
//
//                             case let td where td < 3600:
//                                 timePassed = "\(Int(td/60))m";
//
//                             case let td where td < 86400:
//                                 timePassed = "\(Int(td/3600))h";
//
//                             case let td where td < 2678400:
//                                 timePassed = "\(Int(td/86400))d";
//
//                             case let td where td < 31536000:
//                                 timePassed = "\(Int(td/2678400))month"
//
//                             default:
//                                 timePassed = "\(Int(timeDiff/31536000))";
//
//                             }
//                             self.timeLabel.isHidden = false;
//                             self.timeLabel.text = " · \(timePassed) · "
//
//
//                        }
//                     }
//
//                    }
//                }.resume();
    }
    
    override func prepareForReuse() {
        
    }
    func configure () {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
                
                
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//struct MainData{
//
//}
//
//
