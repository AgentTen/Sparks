//
//  CardsViewController.swift
//  Sparks
//
//  Created by Ryan Farley on 4/24/15.
//  Copyright (c) 2015 ryanfarley. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, SwipeViewDelegate {
    
    struct Card {
        let cardView: CardView
        let swipeView: SwipeView
    }

    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    
    @IBOutlet weak var cardsStackView: UIView!
    
    var backCard: Card?
    var frontCard: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardsStackView.backgroundColor = UIColor.clearColor()
        
        backCard = createCard(backCardTopMargin)
        cardsStackView.addSubview(backCard!.swipeView)
        
        frontCard = createCard(frontCardTopMargin)
        cardsStackView.addSubview(frontCard!.swipeView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRectMake(0, topMargin, cardsStackView.frame.width, cardsStackView.frame.height)
    }
    
    private func createCard(topMargin: CGFloat) -> Card {
        let cardView = CardView()
        let swipeView = SwipeView(frame: createCardFrame(topMargin))
        swipeView.delegate = self
        swipeView.innerView = cardView
        return Card(cardView: cardView, swipeView: swipeView)
    }
    
    // MARK: SwipeViewDelegate
    
    func swipedLeft() {
        println("left")
        if let frontCard = frontCard {
            frontCard.swipeView.removeFromSuperview()
        }
    }
    
    func swipedRight() {
        println("right")
        if let frontCard = frontCard {
            frontCard.swipeView.removeFromSuperview()
        }
    }
}
