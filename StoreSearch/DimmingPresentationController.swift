//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by Webeleven on 26/09/19.
//  Copyright © 2019 Rafael Lehn. All rights reserved.
//

import Foundation
import UIKit

class DimmingPresentationController: UIPresentationController{
    
    lazy var dimmingView = GradientView(frame: CGRect.zero)
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        containerView!.insertSubview(dimmingView, at: 0)
        
        // Animate background gradient view
        dimmingView.alpha = 0
        if let coordinator =
            presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1
            }, completion: nil)
        }
    }
    
    override var shouldRemovePresentersView: Bool{
        return false
    }
    
    override func dismissalTransitionWillBegin()  {
        if let coordinator =
            presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0
            }, completion: nil)
        }
    }
}
