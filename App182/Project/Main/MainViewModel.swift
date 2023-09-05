//
//  MainViewModel.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI
import Alamofire

final class MainViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var lessons: [VideoItem] = []
    
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    @Published var quotes: [String] = ["EURUSD", "EURRUB", "EURTRY", "EURKZT"]
    
    func getCategories() {
        
        isLoading = true
        
        self.fetchCategories(category_id: "") { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchCategories(category_id: String, completion: @escaping (Result<VideoModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "018ba382-4160-4bf2-836c-ab4751727d00",
            "category_id": category_id,
        ]
        
        let request = AF.request("https://proappsuper.ru/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: VideoModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
