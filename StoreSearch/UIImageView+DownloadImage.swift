//
//  UIImageView+DownloadImage.swift
//  StoreSearch
//
//  Created by Webeleven on 26/09/19.
//  Copyright © 2019 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func loadImage(url: URL) -> URLSessionDownloadTask{
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url,
                                                completionHandler: { [weak self] url, response, error in
                                                    // 2
                                                    if error == nil, let url = url,
                                                        let data = try? Data(contentsOf: url),
                                                        let image = UIImage(data: data) {
                                                        // 4
                                                        DispatchQueue.main.async {
                                                            if let weakSelf = self {
                                                                weakSelf.image = image
                                                            }
                                                        }
                                                    }
        })
        // 5
        downloadTask.resume()
        return downloadTask
    }
}
