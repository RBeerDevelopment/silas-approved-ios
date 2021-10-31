//
//  SignInView.swift
//  Silas Approved Stickers
//
//  Created by Robin Beer on 31.10.21.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct SignInView: View {
    
    @State private var isSignUp = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var password2 = ""
    @State private var displayName = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            WelcomeText()
            StyledTextField(title: "Email", content: $email)
            StyledPasswordField(title: "Password", content: $password)
            if(isSignUp) {
                StyledPasswordField(title: "Re-enter Password", content: $password2)
                StyledTextField(title: "Display Name", content: $displayName)
            }
            
            Button(action: { signUpIn() }) {
                Text(self.isSignUp ? "Sign Up" : "Login")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.pink)
                    .cornerRadius(8.0)
                    .textCase(.uppercase)
            }
            .padding()
            
            Button(action: { self.isSignUp.toggle() }) {
                Text(self.isSignUp ? "Login Instead" : "Sign Up Instead")
            }
        }
        .padding()
    }
    
    func signUpIn() {
        if(self.isSignUp) {
            
            if(self.password == self.password2) {
                signUp(onSuccess: onSuccess)
            }
        } else {
            print("SignIn")
            signIn(onSuccess: onSuccess)
        }
        
    }
    
    func onSuccess(token: String) {
        print("OnCusses with token \(token)")
        saveTokenToUserDefaults(token)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func signUp(onSuccess: @escaping (String) -> ()) {
        GraphQLService.shared.apollo.perform(mutation: SignUpMutation(email: self.email, password: self.password, name: self.displayName)) { result in

            switch result {
                case .success(let graphQLResult):
                    if let signUpResult = graphQLResult.data?.signup {
                        if let token = signUpResult.token {
                            onSuccess(token)
                        }
                    }

                    if let errors = graphQLResult.errors {
                        print(errors)
                    }
                case .failure(let error):
                    print(error)
            }
        }
            
    }

    func signIn(onSuccess: @escaping (String) -> ()) {
        GraphQLService.shared.apollo.perform(mutation: LoginMutation(email: self.email, password: self.password)) { result in
            switch result {
                case .success(let graphQLResult):
                    if let loginResult = graphQLResult.data?.login {
                        if let token = loginResult.token {
                            onSuccess(token)
                        }
                    }

                    if let errors = graphQLResult.errors {
                        print(errors)
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}

func saveTokenToUserDefaults(_ token: String) {
    let ud = UserDefaults.standard
    ud.set(token, forKey: UserDefaultsKeys.TOKEN.rawValue)
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct StyledTextField: View {
    
    var title: String
    @Binding var content: String
    
    
    
    var body: some View {
        TextField(self.title, text: $content)
            .padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct StyledPasswordField: View {
    
    var title: String
    @Binding var content: String
    
    var body: some View {
        SecureField(self.title, text: $content)
            .padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
