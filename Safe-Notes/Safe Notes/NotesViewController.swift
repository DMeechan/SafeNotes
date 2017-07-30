//
//  NotesViewController.swift
//  Safe Notes
//
//  Created by Daniel Meechan on 30/07/2017.
//  Copyright © 2017 Rogue Studios. All rights reserved.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  @IBOutlet weak var newNoteTitleField: UITextField!
  @IBOutlet weak var tableView: UITableView!
    
  var notes = [Note]()
  var user = User()
  
  func loadSampleData() {
    user.name = "Jim"
    
    let n1 = Note()
    n1.title = "abc 1"
    n1.content = "abc 2"
    
    let n2 = Note()
    n2.title = "def 1"
    n2.content = "def 2"
    
    let n3 = Note()
    n3.title = "ghi 1"
    n3.content = "ghi 2"
    
    notes += [n1, n2, n3]
    
  }
  
  override func viewDidLoad() {
    print("pls")
    loadSampleData()
    print("ya?")
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("I count... \(notes.count)")
    return notes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("CELL IDENTIFIED")
    let cellIdentifier = "NotesTableViewCell"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NotesTableViewCell else {
      fatalError("The dequeued cell is not an instance of NoteTableViewCell")
    }
    
    let note = notes[indexPath.row]
    
    cell.titleLabel.text = note.title
    cell.previewLabel.text = note.content
    
    
    return cell
    
    
  }
  
  func addNote() {
    
  }
}
