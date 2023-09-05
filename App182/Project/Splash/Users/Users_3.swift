//
//  Users_3.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                
                Color(red: 0/255, green: 194/255, blue: 255/255)
                    .ignoresSafeArea()
                
                Color("bg")
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("users_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 10, content: {
                    
                    Text("Join and earn")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Join our Telegram group and trade with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 194/255, blue: 255/255)))
                        .padding()
                })
                
                NavigationLink(destination: {
                    
                    if isContacts {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                        
                    } else {
                        
                        Users_5()
                            .navigationBarBackButtonHidden()
                    }
                    
                }, label: {
                    
                    Text("Skip")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                })
            }
        }
    }
}

struct Users_3_Previews: PreviewProvider {
    static var previews: some View {
        Users_3(telegram: URL(string: "h")!, isContacts: false)
    }
}
