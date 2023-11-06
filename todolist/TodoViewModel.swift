import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var todos = [Todo]() // published

    func fetchTodos() {
        FetchData.fetchTodos { [weak self] result in // google this more later, weak/strong ref to self?

            switch result {
                case .success(let todos):
                    DispatchQueue.main.async {
                        self?.todos = todos // this. like js
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
