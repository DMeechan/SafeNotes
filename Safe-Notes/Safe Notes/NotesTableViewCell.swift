//
//  NotesTableViewCell.swift
//  Safe Notes
//
//  Created by Daniel Meechan on 30/07/2017.
//  Copyright © 2017 Rogue Studios. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
  
  // MARK: Properties
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var previewLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
