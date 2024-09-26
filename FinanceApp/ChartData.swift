//
//  ChartData.swift
//  FinanceApp
//
//  Created by Mehdi Oturak on 24.09.2024.
//

import Foundation


struct ChartData: Identifiable, Equatable {
    let id = UUID()
    let goalTitle: String
    let goalPercentage: Int
    
    
    static let exampleData: [ChartData] = [
        .init(goalTitle: "Goal 1", goalPercentage: 20),
        .init(goalTitle: "Goal 2", goalPercentage: 60),
        .init(goalTitle: "Goal 3", goalPercentage: 80),
        .init(goalTitle: "Goal 4", goalPercentage: 60),
        .init(goalTitle: "Goal 5", goalPercentage: 20)
    ]
}
