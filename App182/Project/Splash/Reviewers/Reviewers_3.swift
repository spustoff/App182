//
//  Reviewers_3.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct Reviewers_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                
                Color("primary")
                    .ignoresSafeArea()
                
                Color("bg")
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("reviewers_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 10, content: {
                    
                    Text("Calculator")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("All popular currencies in one place")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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

struct Reviewers_3_Previews: PreviewProvider {
    static var previews: some View {
        Reviewers_3()
    }
}
