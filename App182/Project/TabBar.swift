//
//  TabBar.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    if index != .Calculator {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color("primary") : .gray)
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color("primary") : .gray)
                                .font(.system(size: 11, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        
                    } else {
                        
                        Image(index.rawValue)
                            .padding(.horizontal, 7)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 31)
        .background(Color.gray.opacity(0.05))
    }
}

enum Tab: String, CaseIterable {
    
    case Main = "Main"
    
    case Currencies = "Currencies"
    
    case Calculator = "Calculator"
    
    case Achievs = "Achievs"
    
    case Settings = "Settings"
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
