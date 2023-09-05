//
//  AchievementsView.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct AchievementsView: View {
    
    @State var achivs: [Int] = [10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000]
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Achievements")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ForEach(achivs, id: \.self) { index in
                            
                            HStack {
                                
                                Image("trophy")
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text("Earn $\(index)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text("Progress: 0%")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.05)))
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}
