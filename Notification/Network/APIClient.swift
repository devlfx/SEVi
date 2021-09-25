//
//  APIClient.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 24/08/21.
//

import Foundation
import Combine

/**
 Class used to store all API endpoints and configure it's requests. We use combine to expose publishers
 and the restClient for request and decode the resposes when needed.
 */
struct ApiClient{

    public var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .iso8601
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    public var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    private var client : RestClient
    
    static let shared = ApiClient()
    
    private init(){
        client = RestClient(configuration:.default,decoder:decoder)
    }
    
    
    
    
    func login(credentials:Credentials) -> AnyPublisher<TokenResponse,Error> {
        let url = APIConfig.shared.host + "/responsable/login"
        let headers = commonHeaders()
        let data = credentials.encode(with: encoder)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: data, httpMethod: HTTPMethod.POST)

        let request = builder.builURLRequest()
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: TokenResponse.self, recieverQueue: .main)
    }
    
    
    func getStays() -> AnyPublisher<[Stay],Error> {
        let url = APIConfig.shared.host + "/estancia"
        let headers = commonHeaders(requiresAuth: true)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: nil, httpMethod: HTTPMethod.GET)
        let request = builder.builURLRequest()
        
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: [Stay].self, recieverQueue: .main)
    }
    
    
    
    func getStay(stayId:Int) -> AnyPublisher<Stay?,Error>{
        let url = APIConfig.shared.host+"/estancia/\(stayId)"
        let headers = commonHeaders(requiresAuth: true)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: nil, httpMethod: HTTPMethod.GET)
        
        let request = builder.builURLRequest()
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: Stay?.self, recieverQueue: .main)
    }
    
    
    func getInform(informId:Int )-> AnyPublisher<Inform?,Error>{
        let url = APIConfig.shared.host+"/inform/\(informId)"
        let headers = commonHeaders(requiresAuth: true)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: nil, httpMethod: HTTPMethod.GET)
        
        let request = builder.builURLRequest()
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, decodingType: Inform?.self, recieverQueue: .main)
        
    }
    
    func postProcedureInformAuth(procedureInformAuth: ProcedureAuth) -> AnyPublisher<Void, Error>{
        let url = APIConfig.shared.host + "/procedure/authorization"
        let headers = commonHeaders(requiresAuth: true)
        let data = procedureInformAuth.encode(with: encoder)
        let builder = RequestBuilder(url: url, headers: headers, reqBody: data, httpMethod: HTTPMethod.POST)
        
        let request = builder.builURLRequest()
        guard let request = request else { return Fail(error: RequestError.badURL("Bad URL")).eraseToAnyPublisher() }
        return client.execute(request, recieverQueue: .main)
    }
    
    
    
    private func commonHeaders(requiresAuth:Bool = false) -> [String:String]{
        var headers : [String:String] = [
            "Content-type":"application/json",
            "Accept" :"application/json"
        ]
        if requiresAuth, let token = APIConfig.shared.apiToken {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
}
