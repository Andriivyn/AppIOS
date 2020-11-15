//
//  PostListViewController.swift
//  Vynnyk06
//
//  Created by Andrii Vynnyk on 15.11.2020.
//  Copyright © 2020 Andrii Vynnyk. All rights reserved.
//

import UIKit

class PostListViewController: UITableViewController {
   
    private var posts = Welcome.self
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func makeRequest(limit : Int, index : Int){
    URLSession.shared.dataTask(with: URL(string:"https://www.reddit.com/r/ios/top.json?limit=\(limit)")!){
                data, response , error in
                if let dataResponse = data  {
                    do{
                    let decoder = JSONDecoder()
                        let d = try? decoder.decode(Welcome.self, from: dataResponse)

                        print(d!.data.children[index].data.author)

                     DispatchQueue.main.async {
                        posts = d!
                         let currTime = Int(NSDate().timeIntervalSince1970)
    //
                        let timeDiff = currTime - d!.data.children[index].data.createdUtc
                         
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
                         


                    }
                 }

                }
            }.resume();
    



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath)

//         Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


