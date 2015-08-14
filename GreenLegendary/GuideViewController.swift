//
//  GuideViewController.swift
//  BootAnimation
//
//  Created by Emily on 15/4/27.
//  Copyright (c) 2015年 Cctech. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {

    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var guideView: UIImageView!
    
    // MARK: Configuration
    func configurePageControl(pageNum: Int) {
        pageControl.numberOfPages = pageNum
        pageControl.tintColor = UIColor.blueColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = UIColor.applicationGreenColor()
        self.view.addSubview(pageControl)
    }
    
    func showTutor(pageNum :Int)
    {
        self.configurePageControl(pageNum)
        scrollView.contentSize = CGSizeMake(CGFloat(pageNum) * SCREEN_WIDTH, SCREEN_HEIGHT)
        scrollView.backgroundColor = UIColor.grayColor()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.delegate = self;
        
        var i = 0
        for i; i < pageNum; i++ {
            guideView = UIImageView(frame: CGRectMake(CGFloat(i) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
            guideView.image = UIImage(named:NSString(format: "Guide_%d", i+1) as String)
            guideView.userInteractionEnabled = true
            self.scrollView.addSubview(guideView)
            
            if i == pageNum - 1 {
                let tapGest = UITapGestureRecognizer(target: self, action: "tapSkipGuideViewcontroller")
                guideView.addGestureRecognizer(tapGest)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showTutor(4)
    }
    
    // MARK: TapGester Action
    func tapSkipGuideViewcontroller(){
        
        let board = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let loginVC = board.instantiateViewControllerWithIdentifier("loginnav") as! BaseNavigationController
        self.presentViewController(loginVC, animated: false) { () -> Void in
        
        }
//        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    // MARK:scrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var scrollWidth = self.scrollView.frame.size.width
        var page = scrollView.contentOffset.x/scrollWidth
        pageControl.currentPage = Int(page)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
