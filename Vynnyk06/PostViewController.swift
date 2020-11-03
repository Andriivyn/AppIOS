//
//  ViewController.swift
//  Vynnyk06
//
//  Created by Andrii Vynnyk on 30.10.2020.
//  Copyright © 2020 Andrii Vynnyk. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var postTitle: UITextField!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var domainLabel: UILabel!
    @IBOutlet private weak var rating: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var filledBookmark: UIImageView!
    @IBOutlet weak var bookmark: UIImageView!
    @IBOutlet weak var numComents: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _: Void = URLSession.shared.dataTask(with: URL(string:"https://www.reddit.com/r/ios/top.json?limit=1")!){
                   data, response , error in
                   if let dataResponse = data  {
                       do{
                       let decoder = JSONDecoder()
                           let d = try? decoder.decode(Welcome.self, from: dataResponse)
                        
                        print(d!.data.children[0].data.author)
                           
                        DispatchQueue.main.async {
                            self.nicknameLabel.text = d!.data.children[0].data.author
                            self.nicknameLabel.isHidden = false;
                            
                            self.timeLabel.isHidden = false;
                                   
                            self.domainLabel.isHidden = false;
                            self.domainLabel.text = d!.data.children[0].data.domain
                                   
                            self.postTitle.isHidden = false;
                            self.postTitle.text = d!.data.children[0].data.title
                                
                            self.rating.isHidden = false;
                            self.rating.text = "\(d!.data.children[0].data.ups + d!.data.children[0].data.downs)"
                            
                            self.numComents.isHidden = false;
                            self.numComents.text = "\(d!.data.children[0].data.numComments)"
                            
                            self.imageView.load(url: URL(string: "\(d!.data.children[0].data.url)")!)
                            print(d!.data.children[0].data.url)
                            if (d!.data.children[0].data.saved == true) {
                                self.filledBookmark.isHidden = false;
                            }
                            else {
                                self.bookmark.isHidden = false;
                            }
                            
                            let currTime = Int(NSDate().timeIntervalSince1970)
                            print(currTime)
                            
                            let timeDiff = currTime - d!.data.children[0].data.createdUtc
                            
                            var timePassed: String
                            
                            switch timeDiff {
                            case let td where td < 60:
                                timePassed = "now";
                                
                            case let td where td < 3600:
                                timePassed = "\(Int(td/60))m";
                                
                            case let td where td < 86400:
                                timePassed = "\(Int(td/3600))h";
                                
                            case let td where td < 2678400:
                                timePassed = "\(Int(td/86400))d";
                                
                            case let td where td < 31536000:
                                timePassed = "\(Int(td/2678400))month"
                                
                            default:
                                timePassed = "\(Int(timeDiff/31536000))";
                                
                            }
                            self.timeLabel.isHidden = false;
                            self.timeLabel.text = " · \(timePassed) · "
                            

                       }
                    }

                   }
               }.resume();

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
struct MainData{
    
}


struct Welcome: Codable {
    let data: WelcomeData
}

// MARK: - WelcomeData
struct WelcomeData: Codable {
    let children: [Child]
}

// MARK: - Child
struct Child: Codable {
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Codable {
    let saved: Bool
    let title: String
    let downs: Int
    let name: String
    let ups: Int
    let domain, author: String
    let numComments: Int
    let url: String
    let createdUtc: Int

    enum CodingKeys: String, CodingKey {
        case saved, title,  downs, name, ups,  domain, author
        case numComments = "num_comments"
        case url
        case createdUtc = "created_utc"
    }
}

