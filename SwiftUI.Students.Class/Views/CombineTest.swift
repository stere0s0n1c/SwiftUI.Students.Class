//
//  CombineTest.swift
//  SwiftUI.Students.Class
//
//  Created by Ivan Druzhinin on 13.01.2022.
//

import SwiftUI
import Combine

class CombineModel: ObservableObject {

    // INPUT
    @Published var name: String = ""
    @Published var isAllowed: Bool = false

    // OUTPUT
    @Published var isValidName: Bool = false
    @Published var nameColor: Color = .primary
    @Published var hint: String = ""

    private var bag = Set<AnyCancellable>()

    init() {

        $name
            .removeDuplicates()
            .throttle(for: .seconds(1), scheduler: RunLoop.main, latest: true)
            .sink { newValue in
                print("name:", newValue)
            }
            .store(in: &bag)


        $name
            .map({ $0.count > 4 })
            .assign(to: \.isValidName, on: self)
            .store(in: &bag)

        $isValidName
            .map({ $0 ? Color.primary : Color.red })
            .assign(to: \.nameColor, on: self)
            .store(in: &bag)


        var optionalInt: [Int]?
        
        optionalInt? += [1]



        Publishers
            .CombineLatest($isAllowed, $isValidName)
            .map({ isAllowed, isValidName in
                isAllowed && isValidName
            })
            .map({ isValid in
                isValid ? "Одобрено" : "Забраковано"
            })
            .assign(to: \.hint, on: self)
            .store(in: &bag)

    }

}


struct CombineTest: View {

    @StateObject var viewModel = CombineModel()

    var body: some View {
        VStack {
            Text(viewModel.name)
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
                .padding()
                .foregroundColor(viewModel.nameColor)

            Toggle("Allow", isOn: $viewModel.isAllowed)
                .padding()

            Button("Next") {

            }
            .disabled(!viewModel.isValidName)

            Text(viewModel.hint)
                .font(.caption)
                .padding()

            Spacer()
        }
    }
}

struct CombineTest_Previews: PreviewProvider {
    static var previews: some View {
        CombineTest()
    }
}
