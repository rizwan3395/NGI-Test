//
//  CategoryDetailTableViewCell.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit
import Combine

protocol CDCellButtonsDelegate {
    func selectSizeBtn()
    func selectQuantityBtn()
    func placeOrderBtnPressed()
    func addFavouriteBtn()
}

class CategoryDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerImages:UIImageView!
    @IBOutlet weak var categoryNameLbl:UILabel!
    @IBOutlet weak var priceLbl:UILabel!
    @IBOutlet weak var itemDetailsLbl:UILabel!
    
    @IBOutlet weak var btn:UIButton!
    
    var cancellable: AnyCancellable?
    var animator: UIViewPropertyAnimator?
    var cellDelegate:CDCellButtonsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func sizeBtnPressed(){
        cellDelegate?.selectSizeBtn()
    }
    @IBAction func quantityBtnPressed(){
        cellDelegate?.selectQuantityBtn()
    }
    @IBAction func placeOrderBtnPressed(){
        cellDelegate?.placeOrderBtnPressed()
    }
    @IBAction func addFavouriteBtnPressed(){
        cellDelegate?.addFavouriteBtn()
    }
    
    func initliazeValues(item:Category?, perFields:[String:Any]){
        guard let obj = item else {return}
        categoryNameLbl?.text = obj.name
        itemDetailsLbl?.text = obj.longDescription
        priceLbl?.text = "$\(obj.price ?? "0")"
        
        if let title = perFields["title"] as? String {
            btn?.setTitle(title, for: .normal)
        }
        
        cancellable = loadImage(for: obj).sink { [unowned self] image in self.showImage(img: image) }
    }
    
    func loadImage(for category: Category) -> AnyPublisher<UIImage?, Never> {
        return Just(category.largeImageUrl)
            .flatMap({ poster -> AnyPublisher<UIImage?, Never> in
                let url = URL(string: category.imageURL!)!
                return ImageLoader.shared.loadImage(from: url)
            })
            .eraseToAnyPublisher()
    }
    
    func showImage(img: UIImage?) {
        headerImages?.alpha = 0.0
        animator?.stopAnimation(false)
        headerImages?.image = img
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.headerImages?.alpha = 1.0
        })
    }
}
