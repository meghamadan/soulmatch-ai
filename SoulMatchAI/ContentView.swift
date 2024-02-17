//
//  ContentView.swift
//  SoulMatchAI
//
//  Created by Megha Madan on 2/14/24.
//

import SwiftUI
import OAuthSwift
import SafariServices


let contentView = ContentView()
let hostingController = UIHostingController(rootView: contentView)

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
            VStack {
                Text("SoulMatch")
                    .font(.title)
                Image("attached")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                
                Button(action: signIn) {
                    Image("linkedin")
                        .cornerRadius(5)
                }
            }
        }
    }
    
    func signIn() {
        let url = URL(string: "https://www.linkedin.com/oauth/v2/accessToken")
        
       let oauthswift = OAuth2Swift(
            consumerKey:    "86r3z043a1c7bp",
            consumerSecret: "lU5VL518zrckSUoX",
            authorizeUrl:   "https://www.linkedin.com/oauth/v2/authorization",
            responseType:   "token"
        )

        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: hostingController, oauthSwift: oauthswift)
        let _ = oauthswift.authorize(
            withCallbackURL: "oauth-swift:https://oauth.pstmn.io/v1/browser-callback",
            scope: "openid,profile", state:"LINKEDIN-TEST") { result in
            switch result {
            case .success(let (credential, response, parameters)):
              print(credential.oauthToken)
                print (response!)
                print(parameters)
              print("lets authorize :)")
            case .failure(let error):
                print("idk what happened")
              print(error.localizedDescription)
            }
        }
        
       /* let task = URLSession.shared.dataTask(with: (url!)) { data, response, error in
            if let data = data {
                print(data)
            } else if let error = error {
                print("HTTP request failed \(error)")
            }
        }
        task.resume() */
    }
}

#Preview {
    ContentView()
}
