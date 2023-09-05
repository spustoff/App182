//
//  Users_2.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
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
                
                Image("users_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 10, content: {
                    
                    Text("Rate us")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Leave your opinion in the AppStore")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Users_3(telegram: telegram, isContacts: isContacts)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        if isContacts == true {
                            
                            Users_4()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Users_5()
                                .navigationBarBackButtonHidden()
                        }
                    }
                    
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

struct Users_2_Previews: PreviewProvider {
    static var previews: some View {
        Users_2(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
