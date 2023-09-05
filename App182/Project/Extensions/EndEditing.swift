//
//  EndEditing.swift
//  App181
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
