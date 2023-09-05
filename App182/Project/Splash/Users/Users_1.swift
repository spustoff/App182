//
//  Users_1.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct Users_1: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                
                Color("primary")
                    .ignoresSafeArea()
                
                Color("bg")
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("users_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 10, content: {
                    
                    Text("Rise above all")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Achieve maximum success")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Users_2(telegram: telegram, isTelegram: isTelegram, isContacts: isContacts)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

struct Users_1_Previews: PreviewProvider {
    static var previews: some View {
        Users_1(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
