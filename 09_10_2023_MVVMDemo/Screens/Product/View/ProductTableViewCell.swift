//
//  ProductTableViewCell.swift
//  09_10_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 04/02/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    
    //observer property
    var product : Product?{
        didSet{
            productConfiguration()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    func productConfiguration(){
        guard let product else {
            return
        }
        self.productIdLabel.text = String(product.id)
        self.productTitleLabel.text = product.title
    }
}
