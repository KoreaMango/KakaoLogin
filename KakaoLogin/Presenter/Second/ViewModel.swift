//
//  ViewModel.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/12/05.
//

import Foundation

import RxSwift
import RxCocoa

protocol ViewModelType {
    var alamoText: Driver<String>  { get }
    var moyaText: Driver<String> { get }
}

class ViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    
    // output
    var alamoText: Driver<String>?
    var moyaText: Driver<String>?
    
    var networkAlamo: NetworkAlamo?
    var networkMoya: NetworkMoya?
    
    let model = BehaviorSubject<String>(value: "")
    
    init() {
        self.networkAlamo = NetworkAlamo()
        self.networkMoya = NetworkMoya()
        
    }
    
    func fetchAlamoText() {
    
    }
    
    func fetchMoyaText(){
        
    }
    
    
    
    
}
