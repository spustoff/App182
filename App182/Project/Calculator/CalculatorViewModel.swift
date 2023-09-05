//
//  CalculatorViewModel.swift
//  App182
//
//  Created by Вячеслав on 8/31/23.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    
    @Published var usd_field: String = ""
    @Published var eur_field: String = ""
}
