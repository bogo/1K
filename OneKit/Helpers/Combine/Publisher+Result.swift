import Combine
import Foundation

extension Publisher {
    func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        map(Result.success(_:))
            .catch { error in
                Just(Result.failure(error))
            }
            .eraseToAnyPublisher()
    }
}
