//
//  SoulMatchAIApp.swift
//  SoulMatchAI
//
//  Created by Megha Madan on 2/14/24.
//

import SwiftUI
import OAuthSwift

@main
struct SoulMatchAIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        if url.host == "oauth-callback" {
            OAuthSwift.handle(url: url)
        }
}
