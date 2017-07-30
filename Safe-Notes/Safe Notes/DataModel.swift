//
//  DataManager.swift
//  Safe Notes
//
//  Created by Daniel Meechan on 29/07/2017.
//  Copyright © 2017 Rogue Studios. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
  dynamic var name = ""
  dynamic var creationDate = Date()
  dynamic var currentBuild = ""
  // let notes = List<Note>()
  
  func save() {
    do {
      let realm = try Realm()
      
      try realm.write {
        realm.add(self)
        
      }
      
    } catch {
      print("Error, could not save: \(error.localizedDescription)")
      
    }
  }
  
}

class Note: Object {
  dynamic var title: String = ""
  dynamic var content: String = ""
  dynamic var creationDate: Date = Date()
  
  func save() {
    do {
      let realm = try Realm()
      
      try realm.write {
        realm.add(self)
      }
      
    } catch {
      print("Error, could not save: \(error.localizedDescription)")
    }
  }
    
}

class Data {
  
  func getBuildNumber() -> String {
    if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
      return build
    } else {
      return ""
    }
  }
  
  func isNewBuild() -> Bool {
    let current = Int(getBuildNumber())
    // let previous = Int(User[0].buildNum!)
    let previous = 0
    
    if current! > previous {
      // It's a new build
      
    } else {
      return false
      
    }
    
    return true
    
  }
  
}



