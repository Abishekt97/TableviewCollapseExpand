//
//  TableViewCell1.swift
//  TablExpand
//
//  Created by Anil Kumar on 04/09/18.
//  Copyright © 2018 Anil Kumar. All rights reserved.
//

import UIKit

protocol customeDelegate {
  func getSenderTag(_ tagValue: Int)
}

class TableViewCell1: UITableViewCell {


  var delegate : customeDelegate? = nil
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  
}
