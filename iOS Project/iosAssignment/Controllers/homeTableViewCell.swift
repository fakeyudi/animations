//
//  TableViewCell.swift
//  iosAssignment
//
//  Created by Utkarsh Dixit on 7/12/20.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var button: UIButton!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
