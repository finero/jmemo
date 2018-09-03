//
//  ViewController.swift
//  JH Memo
//
//  Created by user1 on 2018. 8. 17..
//  Copyright © 2018년 entro. All rights reserved.
//

import UIKit

class Main: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var MemoData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        return MemoData.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MainCell
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        Cell.TitleLabel.text = MemoData[indexPath.row]
        
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MemoNumber = indexPath.row
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        self.performSegue(withIdentifier: "ToSave", sender: self)
    }
    
    @IBAction func Add(_ sender: Any) {
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
    }
    

}

