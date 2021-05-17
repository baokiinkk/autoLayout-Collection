//
//  ViewController.swift
//  autoLayout
//
//  Created by Quoc Bao on 8/31/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let dataCollect = ["quocbao","chiNhan","DucKhai"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "item")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit/Done", style: .done, target: self, action: #selector(edit))
        
        let size = CGSize(width: collectionView.frame.width-32, height: collectionView.frame.height-32)
               let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
               layout.itemSize = size
    }
    @objc func edit() {
        collectionView.isPrefetchingEnabled.toggle()
       }

}
extension ViewController:UICollectionViewDataSource,Click{
    func onClick(_ str: String) {
        lable.text = str
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataCollect.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
        view.bind(str: dataCollect[indexPath.row],click: self)
        return view
    }
    
    
}
