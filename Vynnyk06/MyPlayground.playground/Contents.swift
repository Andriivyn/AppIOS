import UIKit


struct Children : Codable {
    let kind : String
}

struct RedditPost: Codable {
//    var username:String = ""
//    var domain : String = ""
//    var title: String = ""
////    var timePassed: String = ""
//    var image: URL
//    var numComments:Int = 0
//    var ups : Int = 0
//    var downs : Int = 0
//    var rating: Int = 0
    var dist: Int
//    var children: [Children] = [Children]()
    
    
    private enum RedditResponseKey : String, CodingKey{
        case data
    }
    
    private enum RedditDataInnerKeys : String, CodingKey{
        case children
        case dist

    }
    
    private enum DataKeys : String , CodingKey{
        case kind
        case data
        
    }
    
    private enum MainKeys : String, CodingKey {
        case username = "author_fullname"
        case domain
        case title
//        case timePassed =
        case image = "url"
        case numComments = "num_comments"
        case ups
        case downs

        
        
    }
    
    init(from decoder : Decoder) throws {
        if let redditResponseContainer = try? decoder.container(keyedBy: RedditResponseKey.self){
            
            if let dataResponseContainer = try? redditResponseContainer.nestedContainer(keyedBy: RedditDataInnerKeys.self, forKey : .data){
                
                self.dist = try dataResponseContainer.decode(Int.self, forKey: .dist)
                
//                self.children = try dataResponseContainer.decode([Children].self, forKey: .children)
                
                if let childResponse = try? dataResponseContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .children)
                {
                    self.dist = 321
                    
                }
                
                
                
            }
        }
        self.dist = 321
       
    }
}
URLSession.shared.dataTask(with: URL(string:"https://www.reddit.com/r/ios/top.json?limit=1")!){
    data, _ , _ in
    if let data = data  {
        let reddit = try? JSONDecoder().decode(RedditPost.self, from : data)
        if let reddit = reddit {
            print(reddit)
        }
    }
}.resume();

class HTTPRequest{
    
    
    
    
}
