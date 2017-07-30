//
//  LoginViewController.swift
//  Safe Notes
//
//  Created by Daniel Meechan on 29/07/2017.
//  Copyright © 2017 Rogue Studios. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
      
      let user = User()
      user.name = "Jim"
      let realm = try! Realm()
      
      try! realm.write {
        realm.add(user)
        
      }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
