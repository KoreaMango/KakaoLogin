//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/11/24.
//

import UIKit

import KakaoSDKCommon
import RxKakaoSDKCommon
import KakaoSDKAuth
import RxKakaoSDKAuth
import KakaoSDKUser
import RxKakaoSDKUser

import RxSwift
import SnapKit
import RxCocoa
import RxGesture

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let button : UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "kakao_login_medium_wide")
        view.image = image
        
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .brown
        
        setView()
        setConstraint()
        bind()
    }
    
    func isSetKakao() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.rx.loginWithKakaoTalk()
                .subscribe (onNext: {(oauthToken) in
                    print("loginWithKakaoTalk() success. Set Kakao")
                    AppDelegate.oauthToken = oauthToken
                },onError: { error in
                    print(error)
                })
            .disposed(by: disposeBag)
        }
    }
    
    func webKakaoLogin(){
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
            } else {
                print("login with kakaoAccount() success. Set Web")
                AppDelegate.oauthToken = oauthToken
                self.presentVC()
            }
        }
    }
    
    func presentVC() {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    func setView() {
        self.view.addSubview(button)
    }
    
    func setConstraint() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func bind() {
        button
            .rx
            .tapGesture()
            .when(.recognized)
            .subscribe { [weak self] _ in
                guard let self = self else {return}
                //self.isSetKakao()
                self.webKakaoLogin()
            }
            .disposed(by: disposeBag)
    }
}
