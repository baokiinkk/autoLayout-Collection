//
//  CollectionViewCell.swift
//  autoLayout
//
//  Created by Quoc Bao on 8/31/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    weak var click:Click!
    @IBAction func btn(_ sender: Any) {
        click.onClick(String(textView.text ?? ""))
    }
    @IBOutlet weak var textView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func bind(str:String,click:Click){
        textView.text = str;
        self.click = click
    }
}
protocol Click:class {
    func onClick(_ str:String)
}
