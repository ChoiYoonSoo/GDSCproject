//
//  ContentView.swift
//  QuizProject
//
//  Created by cys on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20){
                    Image("main")
                    /*Text("ㅅㅅㅅ")
                        .font(.system(size: 70))
                        .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("AccentColor"))*/
                    
                    Text("(신조어, 상식, 수도 퀴즈)")
                        .font(.system(size: 20))
                        .foregroundColor(Color("AccentColor"))
                    
                }
                
                NavigationLink{
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "시작")
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
