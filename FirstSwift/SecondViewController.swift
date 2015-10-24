//
//  SecondViewController.swift
//  FirstSwift
//
//  Created by ShaoJun on 15/10/24.
//  Copyright © 2015年 ShaoJun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITextViewDelegate{
    
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var descText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func addBtnClick(sender: AnyObject) {
        todoManager.addTask(todoText.text!, desc: descText.text!)
        self.view.endEditing(true)
        todoText.text = "";
        descText.text = "";
        self.tabBarController?.selectedIndex = 0
        
        let vc : FirstViewController = self.tabBarController!.viewControllers![0] as! FirstViewController
        vc.reloadData()
        NSLog("todo items: %d", todoManager.todos.count)
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
