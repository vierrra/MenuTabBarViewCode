//
//  MainMenuTabBarViewController.swift
//  MenuTabBar
//
//  Created by Renato Vieira on 21/05/22.
//

import UIKit

class MainMenuTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let firstVC = UIViewController(),
        secondVC = UIViewController(),
        thirdVC = UIViewController()
    
    var viewSelectItem = 0
    
    public static let tabBarHeigth: CGFloat = 50
    
    private var tabBarViewControllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setup() {
        configureLayoutControllers()
        populateObjects()
    }
    
    func configureLayoutControllers() {
        firstVC.view.backgroundColor = .white
        secondVC.view.backgroundColor = .cyan
        thirdVC.view.backgroundColor = .systemBlue
    }
    
    func configureTabBar(taBarObjects: [MenuBarDTO],
                         itemsTintColor: UIColor = .white,
                         unselectItemsTintColor: UIColor = .systemGray4) {
        
        self.tabBarViewControllers = taBarObjects.map { $0.controller }
        tabBar.tintColor = itemsTintColor
        tabBar.unselectedItemTintColor = unselectItemsTintColor
        viewControllers = self.tabBarViewControllers
        tabBar.backgroundColor = .darkGray
    }
    
    func populateObjects() {
        let objects = [MenuBarDTO(controller: firstVC, title: "Home", icon: UIImage(named: "home")),
                       MenuBarDTO(controller: secondVC, title: "Notificaçôes", icon: UIImage(named: "notifications")),
                       MenuBarDTO(controller: thirdVC, title: "Menu", icon: UIImage(named: "hamburgerMenu"))]
        
        self.configureTabBar(taBarObjects: objects)
    }
    
    func clickOnCellWith(index: Int, taBarController: UITabBarController, currentViewController: UIViewController) {
        print("Clinck on cell \(index)")
        self.viewSelectItem = index
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        clickOnCellWith(index: tabBarController.selectedIndex,
                        taBarController: tabBarController,
                        currentViewController: viewController)
    }
}

