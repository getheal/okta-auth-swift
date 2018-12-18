//
//  OktaError.swift
//  OktaAuth iOS
//
//  Created by Alex on 13 Dec 18.
//

import Foundation

public enum OktaError: Error {
    case errorBuildingURLRequest
    case connectionError(Error)
    case emptyServerResponse
    case responseSerializationError(Error)
    case serverRespondedWithError(OktaAPIErrorResponse)
    case authenicationStateNotSupported(AuthState)
    case unexpectedResponse
}

public extension OktaError {
    var description: String {
        switch self {
        case .errorBuildingURLRequest:
            return "Error building URL request"
        case .connectionError(let error):
            return "Connection error (\(error.localizedDescription))"
        case .emptyServerResponse:
            return "Empty server response"
        case .responseSerializationError(let error):
            return "Response serialization error (\(error.localizedDescription))"
        case .serverRespondedWithError(let error):
            return "Server responded with error (\(error.errorSummary ?? "?"))"
        case .authenicationStateNotSupported(let state):
            return "Authenication state not supported (\(state.description))"
        case .unexpectedResponse:
            return "Unexpected response"
        }
    }
}
