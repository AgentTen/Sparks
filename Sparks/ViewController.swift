//
//  ViewController.swift
//  Sparks
//
//  Created by Ryan Farley on 4/24/15.
//  Copyright (c) 2015 ryanfarley. All rights reserved.
//

import UIKit

let pageController = ViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)

class ViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let cardsVC: UIViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CardsNavController") as! UIViewController
    
    let profileVC: UIViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileNavController") as! UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor()
        dataSource = self
        
        setViewControllers([cardsVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToNextVC() {
        let nextVC = pageViewController(self, viewControllerAfterViewController: viewControllers[0] as! UIViewController)!
        setViewControllers([nextVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    func goToPreviousVC() {
        let previousVC = pageViewController(self, viewControllerBeforeViewController: viewControllers[0] as! UIViewController)!
        setViewControllers([previousVC], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: nil)
    }
    
    // MARK: UIPageViewControllerDatasource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case cardsVC:
            return profileVC
        case profileVC:
            return nil
        default:
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case cardsVC:
            return nil
        case profileVC:
            return cardsVC
        default:
            return nil
        }
    }
}