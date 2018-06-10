//
//  ArticlesTableViewController.swift
//  XRPUpdate
//
//  Created by Jose on 6/9/18.
//  Copyright © 2018 Jose Benavides. All rights reserved.
//

import UIKit

class ArticlesTableViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //dummy stub array
    let articles: [String] = ["title1 ffwef fekljklj fweafwewaefkhl  wfwef", "title2", "title3", "title4"]
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "cell"
    
     @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        //adjust the row heights
        configureTableView()
        
        //remove the default lines between the table rows
        tableView.separatorStyle = .none
        
    }
    
    //set the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    //this creates cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ArticleCellView = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ArticleCellView
        
        //pupulate the cell with data
        cell.title.text = self.articles[indexPath.row]
        cell.author.text = "XRP Hodor"
        cell.timeStamp.text = "2 hours ago"
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

    //make the table view resizable depending on the amount of content
    func configureTableView(){
        
        //let the height grow based on the amount of content in the element
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //set a minimum base height
        tableView.estimatedRowHeight = 325
        
        tableView.reloadData()
        
    }
    // MARK: - Table view data source

  
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
