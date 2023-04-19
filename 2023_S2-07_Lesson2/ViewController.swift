//
//  ViewController.swift
//  2023_S2-07_Lesson2
//
//  Created by Emmanuel Yee Hong Wei on 19/4/23.
//
import UIKit

class ViewController: UIViewController {
    // Variables
    var arrPN = ["AI1.png","AI2.png","AI3.png","AI4.png"]
    var arrLC = ["Ai gen 1","AI gen 2","AI gen 3","AI gen 4"]
    var cur = 0
    
    
    // Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label_Caption: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // Actions
    @IBAction func scrollPhotos(_ sender: Any) {
        cur = pageControl.currentPage
        imageView.image = UIImage(named: arrPN[cur])
        label_Caption.text = arrLC[cur]
    }
    
    @IBAction func forward(_ sender: Any) {
        if cur < arrPN.count - 1 {
            cur = cur + 1
            pageControl.currentPage = cur
            imageView.image = UIImage(named: arrPN[cur])
            label_Caption.text = arrLC[cur]
        }
    }
    
    @IBAction func backward(_ sender: Any) {
        if cur > 0 {
            cur = cur - 1
            pageControl.currentPage = cur
            imageView.image = UIImage(named: arrPN[cur])
            label_Caption.text = arrLC[cur]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = arrPN.count
        imageView.image = UIImage(named: arrPN[cur])
        label_Caption.text = arrLC[cur]
        
        // Swipe Gestures
        let swipeL = UISwipeGestureRecognizer(target: self, action: #selector(forward(_:)))
        swipeL.direction = .left
        self.view.addGestureRecognizer(swipeL)
        
        let swipeR = UISwipeGestureRecognizer(target: self, action: #selector(backward(_:)))
        swipeR.direction = .right
        self.view.addGestureRecognizer(swipeR)
    }
}
