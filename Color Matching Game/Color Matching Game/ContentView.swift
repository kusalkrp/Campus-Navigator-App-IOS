import SwiftUI

// Model for each color block
struct ColorBlock: Identifiable {
    let id = UUID()
    var color: Color
    var isMatched: Bool = false
    var isSelected: Bool = false
}

// ViewModel for game logic
class GameViewModel: ObservableObject {
    @Published var blocks: [ColorBlock] = []
    @Published var selectedIndices: [Int] = []

    let gridSize = 4 // 4x4 Grid

    init() {
        startGame()
    }

    func startGame() {
        let baseColors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .pink, .cyan]
        var colors = baseColors + baseColors // two of each color
        colors.shuffle()

        blocks = colors.map { ColorBlock(color: $0) }
        selectedIndices = []
    }

    func selectBlock(at index: Int) {
        guard !blocks[index].isMatched else { return }
        guard !selectedIndices.contains(index) else { return }

        blocks[index].isSelected = true
        selectedIndices.append(index)

        if selectedIndices.count == 2 {
            checkMatch()
        }
    }

    func checkMatch() {
        let firstIndex = selectedIndices[0]
        let secondIndex = selectedIndices[1]

        if blocks[firstIndex].color == blocks[secondIndex].color {
            blocks[firstIndex].isMatched = true
            blocks[secondIndex].isMatched = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.blocks[firstIndex].isSelected = false
            self.blocks[secondIndex].isSelected = false
            self.selectedIndices = []
        }
    }
}

// Main game view
struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Color Matching Game")
                .font(.largeTitle)
                .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: viewModel.gridSize), spacing: 10) {
                ForEach(viewModel.blocks.indices, id: \.self) { index in
                    let block = viewModel.blocks[index]
                    Rectangle()
                        .fill(block.isMatched || block.isSelected ? block.color : Color.gray)
                        .frame(height: 60)
                        .cornerRadius(8)
                        .onTapGesture {
                            viewModel.selectBlock(at: index)
                        }
                        .animation(.easeInOut, value: block.isSelected)
                }
            }

            Button("Restart Game") {
                viewModel.startGame()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

// Xcode preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
