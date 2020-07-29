//
//  SplashViewController.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    
    // MARK: - Setters
        
    private(set) var scene: Scene! = .none {
        didSet {
            self.isReadyWorkspace = true
        }
    }
    
    private var isReadyWorkspace: Bool = false {
        didSet {
            if self.isReadyWorkspace {
                self.didReadyWorkspace?()
                self.loadScene(self.scene)
            }
        }
    }
    
    // MARK: - Callbacks
    
    private var didReadyWorkspace: (() -> ())? = nil
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareWorkspace()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

// MARK: - Private

extension SplashViewController {
    
    private func prepareWorkspace() {
        if APIClient.shared.isLogged {
            self.loadUserWorkspace()
        } else {
            self.prepareAuthSequence()
        }
    }
    
    private func prepareAuthSequence() {
        self.scene = Scene.signIn
    }
    
    private func prepareUserWorkspace() {
        self.scene = Scene.main
    }
    
    private func loadUserWorkspace() {
        self.scene = Scene.main
    }
    
}

// MARK: - UIStatusBarStyle

extension SplashViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}

//MARK: - StoryboardInstantiable

extension SplashViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        return Storyboard.splash
    }
        
}
