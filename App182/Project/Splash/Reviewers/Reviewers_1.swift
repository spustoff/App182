//
//  Reviewers_1.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                
                Color("primary")
                    .ignoresSafeArea()
                
                Color("bg")
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("reviewers_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 10, content: {
                    
                    Text("Everything important")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Everything you need on the main")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_2()
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

struct Reviewers_1_Previews: PreviewProvider {
    static var previews: some View {
        Reviewers_1()
    }
}
