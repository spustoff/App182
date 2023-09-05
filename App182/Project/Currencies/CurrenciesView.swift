//
//  CurrenciesView.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel = CurrenciesViewModel()
    
    var body: some View {
       
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("My Currencies")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text("Your Balance")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$\(10000)")
                                .foregroundColor(.white)
                                .font(.system(size: 21, weight: .semibold))
                        })
                        .padding()
                        .padding(.bottom, 40)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                        
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("primary"))
                                
                                Image("rectangle")
                                    .resizable()
                            }
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selected_currency = index
                                viewModel.isDetail = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 5, content: {
                                        
                                        Text("$\(Int.random(in: 1...25000))")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15 ,weight: .regular))
                                        
                                        Text("+\(Int.random(in: 1...10))%")
                                            .foregroundColor(.green)
                                            .font(.system(size: 12, weight: .regular))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.05)))
                                .padding(.horizontal)
                            })
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CurrenciesDetail(pair: viewModel.selected_currency)
        })
    }
}

struct CurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView()
    }
}
