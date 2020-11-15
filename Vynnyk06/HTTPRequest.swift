//
//  HTTPRequest.swift
//  Vynnyk06
//
//  Created by Andrii Vynnyk on 15.11.2020.
//  Copyright © 2020 Andrii Vynnyk. All rights reserved.
//

import Foundation
//
//class HTTPRequest {
//    var mainData = PostData(posts: []);
////    let limit : Int
////    init(limit: Int) {
////        self.limit = limit
////       URLSession.shared.dataTask(with: URL(string:"https://www.reddit.com/r/ios/top.json?limit=\(limit)")!){
////                   data, response , error in
////                   if let dataResponse = data  {
////                       do{
////                       let decoder = JSONDecoder()
////                           let d = try? decoder.decode(Welcome.self, from: dataResponse)
////
////
////                        DispatchQueue.main.async {
////                           self.mainData = PostData (posts: d!.data.children)
//////                            self.mainData.posts = d!.data.children
////                                                    }
////
////        }
////            }
////
//////    print(self.mainData.posts)
////    }.resume();
//        
//    
//// }
//    
//    func makePost(limit: Int) -> PostData {
//        
//        var mainData = PostData(posts: [])
//         URLSession.shared.dataTask(with: URL(string:"https://www.reddit.com/r/ios/top.json?limit=\(limit)")!){
//                           data, response , error in
//                           if let dataResponse = data  {
//                               do{
//                               let decoder = JSONDecoder()
//                                   let d = try? decoder.decode(Welcome.self, from: dataResponse)
//                                
//                                   
////                                DispatchQueue.main.async {
//                                   mainData = PostData (posts: d!.data.children)        //                            self.mainData.posts = d!.data.children
////                                                            }
//                                                }
//                    }
//                    
//            
//            }.resume();
//        print(mainData)
//        return mainData;
//    }
//}
//
//    
//
//
//
//struct Welcome: Codable {
//    let data: WelcomeData
//}

// MARK: - WelcomeData
//struct WelcomeData: Codable {
//    let children: [Child]
//}
//
//// MARK: - Child
//struct Child
//
//// MARK: - ChildData
//struct ChildData: Codable {
//    let saved: Bool
//    let title: String
//    let downs: Int
//    let name: String
//    let ups: Int
//    let domain, author: String
//    let numComments: Int
//    let url: String
//    let createdUtc: Int
//
//    enum CodingKeys: String, CodingKey {
//        case saved, title,  downs, name, ups,  domain, author
//        case numComments = "num_comments"
//        case url
//        case createdUtc = "created_utc"
//    }
//}
//
//
//struct Child {
//    var saved: Bool
//       var title: String
//       var downs: Int
//       var name: String
//       var ups: Int
//    var domain, author: String
//       var numComments: Int
//       var url: String
//       var createdUtc: Int
//}
//
//struct PostData {
//    var posts : [Child]
//}
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
