//
//  FirstViewController.swift
//  FirstSwift
//
//  Created by ShaoJun on 15/10/24.
//  Copyright © 2015年 ShaoJun. All rights reserved.
//

import UIKit

class FirstViewController: ViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var todoTableView: UITableView!
    
    var todos : [todo] = []
    
    override init(_ coder: NSCoder? = nil) {
        self.todos = todoManager.queryAllTask()
        
        super.init(coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        NSLog("count: %d", self.todos.count)
        return self.todos.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        
        cell.textLabel?.text = self.todos[indexPath.row].name
        cell.detailTextLabel?.text = self.todos[indexPath.row].desc
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            todoManager.deleteTask(indexPath.row)
        }
        reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination : FeedsViewController = storyboard.instantiateViewControllerWithIdentifier("FeedsViewController") as! FeedsViewController
        destination.rssURL = self.todos[indexPath.row].name
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func reloadData(){
        self.todos = todoManager.queryAllTask()
        todoTableView.reloadData()
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
