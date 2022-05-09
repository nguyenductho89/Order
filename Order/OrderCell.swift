//
//  OrderCell.swift
//  Order
//
//  Created by thond02 on 09/05/2022.
//

import UIKit

class OrderCell: UITableViewCell {
    var dish: Dishes?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var disheName: UILabel!
    @IBOutlet weak var disheState: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        disheState.setImage(.checkmark, for: .selected)
        disheState.setImage(.remove, for: .normal)
    }

    func setDish(_ dish: Dishes) {
        //self.imageView?.image =
        self.dish = dish
        disheName.text = dish.name
    }
    
    @IBAction func selectButton(_ sender: SelectButton) {
        sender.isSelected = !sender.isSelected
        dish?.isDelivered = sender.isSelected
    }
    
}

class SelectButton: UIButton {

}

extension UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
