//
//  UIImageView+Rx.swift

import Foundation

extension Reactive where Base: UIImageView {
    
    var avatarBinding: Binder<String> {
        return Binder(base) { imageView, imageUrl in
            let url = URL(string: imageUrl)
            imageView.sd_setImage(with: url, completed: nil)
        }
    }
}
