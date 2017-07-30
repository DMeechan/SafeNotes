//
//  NotesTableViewController.swift
//  Safe Notes
//
//  Created by Daniel Meechan on 23/07/2017.
//  Copyright © 2017 Rogue Studios. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

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
    loadSampleData()
    
    
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "NotesTableViewCell"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NotesTableViewCell else {
      fatalError("The dequeued cell is not an instance of NoteTableViewCell")
    }
    
    let note = notes[indexPath.row]
    
    cell.titleLabel.text = note.title
    cell.previewLabel.text = note.content
    
    
    return cell
    
    
  }

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      
      
    }
  

}
