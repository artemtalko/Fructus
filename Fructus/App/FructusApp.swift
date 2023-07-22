//
//  FructusApp.swift
//  Fructus
//
//  Created by Artem Talko on 20.07.2023.
//

import SwiftUI

@main
struct FructusApp: App {
	@AppStorage("isOnboarding") var isOnboarding: Bool = false
	
    var body: some Scene {
        WindowGroup {
					if isOnboarding {
						OnboardingView()
					} else {
						ContentView()
					}
        }
    }
}
