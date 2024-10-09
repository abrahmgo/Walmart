//
//  APIManager.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

enum APIError: Error {
    case badRequest
    case serverError
    case unknown
}

protocol APIRequestProtocol {
    func get(request: URLRequest) async throws -> Result<Data, Error>
}

final class APIRequest: APIRequestProtocol {

    func get(request: URLRequest) async throws -> Result<Data, Error> {
        let (data, response) = try await URLSession.shared.data(for: request)
        return verifyResponse(data: data, response: response)
    }

    private func verifyResponse(data: Data, response: URLResponse) -> Result<Data, Error> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(APIError.unknown)
        }

        switch httpResponse.statusCode {
        case 200...299:
            return .success(data)
        case 400...499:
            return .failure(APIError.badRequest)
        case 500...599:
            return .failure(APIError.serverError)
        default:
            return .failure(APIError.unknown)

        }
    }
}
