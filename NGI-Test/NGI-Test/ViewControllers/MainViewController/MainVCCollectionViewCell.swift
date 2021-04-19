//
//  MainVCCollectionViewCell.swift
//  NGI-Test
//
//  Created by muhammad on 18/04/2021.
//

import UIKit
import Combine

class MainVCCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var detail:UILabel!
    @IBOutlet weak var image:UIImageView!
    var cancellable: AnyCancellable?
    var animator: UIViewPropertyAnimator?
    
    override func awakeFromNib() {
        
    }
    
    func setupData(obj:Category){
        self.title?.text = obj.name
        self.detail?.text = obj.detail
        cancellable = loadImage(for: obj).sink { [unowned self] image in self.showImage(img: image) }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        image.alpha = 0.0
        animator?.stopAnimation(true)
        cancellable?.cancel()
    }
    
    
    func loadImage(for category: Category) -> AnyPublisher<UIImage?, Never> {
        return Just(category.imageURL)
            .flatMap({ poster -> AnyPublisher<UIImage?, Never> in
                let url = URL(string: category.imageURL!)!
                return ImageLoader.shared.loadImage(from: url)
            })
            .eraseToAnyPublisher()
    }
    
    func showImage(img: UIImage?) {
        image.alpha = 0.0
        animator?.stopAnimation(false)
        image.image = img
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.image.alpha = 1.0
        })
    }
}
