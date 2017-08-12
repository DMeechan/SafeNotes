//
//  EditNoteViewController.swift
//  Safe Notes
//
//  Created by Daniel Meechan on 23/07/2017.
//  Copyright © 2017 Rogue Studios. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {
  
  var note = Note()
  
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var contentField: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleField.text = note.title
    contentField.text = note.content
    
  }
  

}
