//
//  LoadingView.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                Image("graph")
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
