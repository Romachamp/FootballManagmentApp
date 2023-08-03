//
//  SignInView.swift
//  GreenShop
//
//  Created by Роман on 19.07.2023.
//
import SwiftUI
import GoogleSignIn
import Firebase

struct SignInView: View {
    @State private var userEmail: String? = nil
    @Binding var isSignedIn: Bool
    let DEFAULTS = UserDefaults.standard

    var body: some View {
        VStack {
            if let email = userEmail {
                Text("\(email)")
            } else {
                Button(action: {
                    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let window = scene.windows.first,
                          let presentingViewController = window.rootViewController else {
                        return print("Error: Can't get presenting view controller")
                    }
                    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { user, error in
                        handleSignInResult(result: user, error: error)
                    }
                }) {
                    SignInButtonView(companyName: "Google", companyIcon: "GoogleLogo")
                }
            }
        }
    }

    func handleSignInResult(result: GIDSignInResult?, error: Error?) {
            if let error = error {
                print("Google sign-in error: \(error.localizedDescription)")
                return
            }

            if let user = result?.user {
                let email = user.profile?.email
                userEmail = email
                DEFAULTS.set(email, forKey: "USER_EMAIL")
                isSignedIn = true
            }
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
