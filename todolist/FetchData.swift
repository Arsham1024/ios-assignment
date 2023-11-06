import Foundation

struct TodosResponseModel: Decodable {
    var todos: [Todo]
    var total: Int
    var skip: Int
    var limit: Int
}

struct FetchData {
    static func fetchTodos(completion: @escaping (Result<[Todo], Error>) -> Void) {
        let url = URL(string: "https://dummyjson.com/todos")! // hardcoded null safe

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }

            // Print the raw data as a string for debugging
            if let rawResponseString = String(data: data, encoding: .utf8) {
                print("Raw response: \n\(rawResponseString)")
            }

            do {
                let todosResponse = try JSONDecoder().decode(TodosResponseModel.self,
                                                             from: data)
                completion(.success(todosResponse.todos))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}

