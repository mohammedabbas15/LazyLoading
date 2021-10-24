//
//  AnimalCell.swift
//  JSONImage
//
//  Created by Field Employee on 10/20/21.
//

import UIKit

class AnimalCell: UITableViewCell {
    
    @IBOutlet var animalName: UILabel!
    @IBOutlet var animalImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        if selected {
//            print("Selected...")
//
//        } else {
//            print("do nothing")
//        }
//    }
}
