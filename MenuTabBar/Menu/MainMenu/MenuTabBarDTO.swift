//
//  MenuTabBarDTO.swift
//  MenuTabBar
//
//  Created by Renato Vieira on 21/05/22.
//

import UIKit

public class MenuBarDTO {
    var controller: UIViewController
    
    init(controller: UIViewController, title: String, icon: UIImage?) {
        self.controller = controller
        
        controller.title = title
        
        if let icon = icon {
            controller.tabBarItem.image = icon
        }
    }
}
