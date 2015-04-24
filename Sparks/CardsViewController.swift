//
//  CardsViewController.swift
//  Sparks
//
//  Created by Ryan Farley on 4/24/15.
//  Copyright (c) 2015 ryanfarley. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    
    @IBOutlet weak var cardsStackView: UIView!
    
    var backCard: SwipeView?
    var frontCard: SwipeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardsStackView.backgroundColor = UIColor.clearColor()
        
        backCard = SwipeView(frame: createCardFrame(backCardTopMargin))
        cardsStackView.addSubview(backCard!)
        
        frontCard = SwipeView(frame: createCardFrame(frontCardTopMargin))
        cardsStackView.addSubview(frontCard!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRectMake(0, topMargin, cardsStackView.frame.width, cardsStackView.frame.height)
    }
}
