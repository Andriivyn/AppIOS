import UIKit

struct Reddit : Decodable{
    var data : DataStruct
    struct  DataStruct : Decodable{
        var childer : [ItemStruct]
        struct ItemStruct : Decodable{
            
            var data : ItemDataStruct
            struct ItemDataStruct: Decodable{
                var author : String
                var domain: String
            }
        }
    }
}

func process(resJSON: Reddit){
    var finalStr = " >> Listing length : \(resJSON.data.childer.count)"
    finalStr += "\n >>> Listing post"
    for (index, post) in resJSON.data.childer.enumerated(){
        finalStr += "\n\n\t[\(index + 1)]:"
        finalStr += "\n\t username: [\(post.data.author)"
        
        let currTime = Int(NSDate().timeIntervalSince1970);
//        let timeDiff  = currTime - post.data.cre
        
        
        
    }
}
func makeRequest()  {

    guard let url = URL(string :  "https://www.reddit.com/r/ios/top.json?limit=1") else{
        return}
    
    let task: Void =  URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let dataRest = data{
                do
                {
                    let decoder = JSONDecoder();
                    
                    let model = try decoder.decode(Reddit.self, from: dataRest)
                    print(model.data)
                    
                } catch let parsErr {
                    print ("error")
                }
                
            }
    }.resume()
}
