//
//  UIImageView+Extend.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

import UIKit

extension UIImageView {
    func loadImageAsync(url: URL?, defaultImage: UIImage?) -> Void {
        if url == nil {
            self.image = defaultImage
            
            return
        }
        
        DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            } catch {
                DispatchQueue.main.async {
                    self.image = defaultImage
                }
            }
        }
    }
}
