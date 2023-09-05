//
//  CurrenciesViewModel.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

final class CurrenciesViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false
    
    @Published var currencies: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURJPY", "USDTRY", "USDRUB", "USDKZT", "KZTRUB", "KZTTRY", "KZTJPY", "KZTCAD"]
    @Published var selected_currency: String = ""
}
