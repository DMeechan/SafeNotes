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
  
  var notes = [Note]()
  var user = User()
  
  var selectedNoteIndex: Int = 0
  
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
    super.viewDidLoad()
    loadSampleData()
    
  }
  
  // MARK: TableView
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "NotesTableViewCell"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NotesTableViewCell else {
      fatalError("The dequeued cell is not an instance of NoteTableViewCell")
    }
    
    let note = notes[indexPath.row]
    
    if note.content == "" {
      cell.titleLabel.text = ""
      cell.previewLabel.text = ""
      cell.contentLabel.text = note.title
      
    } else {
      cell.titleLabel.text = note.title
      cell.previewLabel.text = note.content
      cell.contentLabel.text = ""
      
    }
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // User has clicked on item in TableView
    print("USER HAS CLICKED ROW: \(indexPath.row)")
    selectedNoteIndex = indexPath.row
    performSegue(withIdentifier: "segueToEditNote", sender: self)
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    // Return number of sections
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Returns how many cells to show in table
    return notes.count
  }
  
  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Allow moving cells
    return true
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    // Sort out what to do when moving cells
    let note = notes[sourceIndexPath.row]
    notes.remove(at: sourceIndexPath.row)
    notes.insert(note, at: destinationIndexPath.row)
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    // Allow cell deletion
    if editingStyle == UITableViewCellEditingStyle.delete {
      notes.remove(at: indexPath.row)
      tableView.reloadData()
    }
    
  }
  
  func addNote() {
    
    if newNoteTitleField.text != "" {
      let note = Note()
      note.title = newNoteTitleField.text!
      
      notes.append(note)
      // note.save()
      
      newNoteTitleField.text = ""
      
    }
    
    tableView.reloadData()
    hideKeyboard()
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueToEditNote" {
      let destination = segue.destination as? EditNoteViewController
      destination?.note = self.notes[selectedNoteIndex]
      
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    hideKeyboard()
  }
  
  func hideKeyboardOnTableViewClick() {
    // Hide keyboard when TableView clicked
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NotesViewController.hideKeyboard))
    tapGesture.cancelsTouchesInView = true
    tableView.addGestureRecognizer(tapGesture)
    
  }
  
  func hideKeyboard() {
    UIView.animate(withDuration: 0.2, animations: {
      self.view.endEditing(true) //This will hide the keyboard
    })
    
  }
  
  @IBOutlet weak var newNoteTitleField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func clickAdd(_ sender: Any) {
    addNote()
  }
}
