//
//  SecondViewController.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/11/25.
//
import UIKit

import RxCocoa
import SnapKit

class SecondViewController: UIViewController {
    lazy var lbKakao: UILabel = {
        let label = UILabel()
        var txt = "kakao: "
        label.text = txt
        return label
    }()
    
    lazy var lbAlamo: UILabel = {
        let label = UILabel()
        var txt = "alamo: "
        label.text = txt
        return label
    }()
    
    lazy var lbMoya: UILabel = {
        let label = UILabel()
        var txt = "moya: "
        label.text = txt
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setView()
        setConstraint()
        MyAPI().request()
    }
    
    func setView() {
        self.view.addSubview(lbKakao)
        self.view.addSubview(lbAlamo)
        self.view.addSubview(lbMoya)
    }
    
    func setConstraint() {
        lbKakao.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            make.centerX.equalToSuperview()
        }
        
        lbAlamo.snp.makeConstraints { make in
            make.top.equalTo(lbKakao.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        
        lbMoya.snp.makeConstraints { make in
            make.top.equalTo(lbAlamo.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
}
