//
//  SettingsView.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isResetted: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1AJkovu3YU_ioRUZGE8FudZMqdY8eHcanvxGIwb86HZI/edit") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.05)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Rate Us")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.05)))
                    .padding(.horizontal)
                })
                
                if !isResetted {
                    
                    Button(action: {
                        
                        isResetted = true
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text("Reset Progress")
                                .foregroundColor(.red)
                                .font(.system(size: 14, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.05)))
                        .padding(.horizontal)
                    })
                }
                
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
