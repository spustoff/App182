//
//  CalculatorView.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calculator")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(spacing: 15, content: {
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$0.00")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                                .opacity(viewModel.usd_field.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.usd_field)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                                .keyboardType(.decimalPad)
                        })
                        
                        Spacer()
                        
                        HStack {
                            
                            Image("usd")
                            
                            Text("USD")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    }
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$0.00")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 22, weight: .semibold))
                                .opacity(viewModel.eur_field.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.eur_field)
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 22, weight: .semibold))
                                .keyboardType(.decimalPad)
                        })
                        
                        Spacer()
                        
                        HStack {
                            
                            Image("eur")
                            
                            Text("EUR")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    }
                })
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.endEditing()
                    
                    viewModel.eur_field.removeAll()
                    viewModel.usd_field.removeAll()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.eur_field.isEmpty || viewModel.usd_field.isEmpty ? 0.5 : 1)
                .disabled(viewModel.eur_field.isEmpty || viewModel.usd_field.isEmpty ? true : false)
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
