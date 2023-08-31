//
//  Extensions.swift
//  QuizProject
//
//  Created by cys on 2023/08/08.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
