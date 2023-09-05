//
//  CurrenciesDetail.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct CurrenciesDetail: View {
    
    let pair: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 7, content: {
                    
                    Text(pair)
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .medium))
                    
                    HStack(alignment: .bottom) {
                        
                        Text("$\(Int.random(in: 1...250000))")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .regular))
                        
                        Text("+\(Int.random(in: 1...25))%")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top)
                
                Chart(pair: pair)
                    .disabled(true)
                
                HStack {
                    
                    Text("Buy")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    
                    Text("Sell")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                }
                .padding(.horizontal)
                .opacity(0.3)
            }
        }
    }
}

struct CurrenciesDetail_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesDetail(pair: "EURUSD")
    }
}
