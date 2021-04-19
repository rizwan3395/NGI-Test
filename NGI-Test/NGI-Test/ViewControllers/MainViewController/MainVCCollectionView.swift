//
//  MainVCCollectionView.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit

protocol MainVCCollectionCellDelegate {
    func selectedCategory(category:Category)
}

class MainVCCollectionView: UICollectionView  {
        
    var dataArray:[Category] = []
    var cellDelegate:MainVCCollectionCellDelegate?
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: MainVCCollectionViewCell.nameOfClass(), bundle: nil), forCellWithReuseIdentifier: MainVCCollectionViewCell.nameOfClass())
        
    }
    
    func reloadWithData(array:[Category]) {
        dataArray = array
        self.reloadData()
    }
}

extension MainVCCollectionView: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let object = dataArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVCCollectionViewCell.nameOfClass(), for: indexPath) as! MainVCCollectionViewCell
        cell.setupData(obj: object)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = dataArray[indexPath.row]
        self.cellDelegate?.selectedCategory(category: object)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2   //number of column on screen
        let noOfRowsOnScreen = 2.75 //number of rows on screen
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let totalHeightSpace = flowLayout.sectionInset.top
            + flowLayout.sectionInset.bottom

        let width = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        let height = Int((collectionView.bounds.height - totalHeightSpace) / CGFloat(noOfRowsOnScreen))
                
        return CGSize(width: width, height: height)
    }
}
