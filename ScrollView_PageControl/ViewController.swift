//
//  ViewController.swift
//  ScrollView_PageControl
//
//  Created by Salma on 11/30/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [String] = ["0", "1", "2"]
    var frame = CGRect(x: 0, y: 0, width: 0, height:0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        for index in 0..<images.count {
            frame.origin.y = scrollView.frame.size.height * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: (scrollView.frame.size.height * CGFloat(images.count)))
        scrollView.delegate = self
    }
    
    // ScrollView Method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.y / scrollView.frame.size.height
        pageControl.currentPage = Int(pageNumber)
    }


}

