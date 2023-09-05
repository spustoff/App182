//
//  MainView.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Main")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            Text("Video Lessons")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            if viewModel.isLoading {
                                
                                ProgressView()
                                
                            } else {
                                
                                ScrollView(.horizontal, showsIndicators: false) {

                                    HStack {

                                        ForEach(viewModel.lessons, id: \.self) { index in

                                            Button(action: {

                                                viewModel.selectedLesson = index
                                                viewModel.isDetail = true

                                            }, label: {

                                                VStack(alignment: .leading, spacing: 10) {

                                                    if let image = index.image {

                                                        WebPic(urlString: image, width: 200, height: 120, cornerRadius: 10, isPlaceholder: true)
                                                    }

                                                    VStack(alignment: .leading, spacing: 15, content: {

                                                        HStack(content: {
                                                            
                                                            Image(systemName: "timer")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 12, weight: .regular))
                                                            
                                                            Text("\(index.duration ?? 0) minutes")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 13, weight: .regular))
                                                        })

                                                        Text(index.title ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .medium))
                                                            .lineLimit(1)
                                                    })
                                                }
                                                .padding(.bottom, 5)
                                                .frame(width: 200)
                                            })
                                        }
                                    }
                                }
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .onAppear {
                            
                            viewModel.getCategories()
                        }
                        
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            Text("Currency Quotes")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(viewModel.quotes, id: \.self) { index in
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            Text(index)
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Text("$\(Int.random(in: 1...25000))")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .bold))
                                            
                                            Text("+\(Int.random(in: 1...5))%")
                                                .foregroundColor(.green)
                                                .font(.system(size: 12, weight: .regular))
                                        })
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.07)))
                                    }
                                }
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            Text("My Calculations")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            HStack {
                                
                                Image("empty")
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Empty")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("You don't have any calculations yet")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                }
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            LessonsDetail(index: viewModel.selectedLesson)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
