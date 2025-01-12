//
//  Router.swift
//  Flash
//
//  Created by Coder on 1/11/25.
//

import Foundation
import SwiftUI
import Observation

@Observable
class Router {
    var path = NavigationPath()
    
    func navigateToLogin() {
        
    }
    
    func navigateToSetup() {
        path.append(Route.setup)
    }
    
    func navigateToFlashCardsList() {
        path.append(Route.flashCardsList)
    }
    
    func popToRoot() {
        path.removeLast()
    }
}

enum Route: Hashable {
    case setup
    case flashCardsList
    case login
}
