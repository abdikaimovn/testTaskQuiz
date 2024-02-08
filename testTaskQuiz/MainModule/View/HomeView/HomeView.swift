//
//  HomeView.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 04.02.2024.
//

import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject {
    func showQuizModule(with type: ModuleType)
}

final class HomeView: UIView {
    weak var parentVC: HomeViewDelegate?
    private let footballView = UIImageView()
    private let basketballView = UIImageView()
    private let mixedView = UIImageView()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.backgroundColor = .clear
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupView() {
        backgroundColor = .clear
        setupImageViews()
        
        stackView.addArrangedSubview(footballView)
        stackView.addArrangedSubview(basketballView)
        stackView.addArrangedSubview(mixedView)
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupImageViews() {
        [footballView, basketballView, mixedView].forEach { view in
            view.backgroundColor = .clear
            view.contentMode = .scaleAspectFit
            view.isUserInteractionEnabled = true
        }
        
        footballView.image = UIImage(named: "footballImage")
        basketballView.image = UIImage(named: "basketballImage")
        mixedView.image = UIImage(named: "mixedImage")
        
        footballView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(footballViewTapped)))
        
        basketballView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(basketballViewTapped)))
        
        mixedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mixedViewTapped)))
    }
    
    @objc private func footballViewTapped() {
        parentVC?.showQuizModule(with: .football)
    }
    
    @objc private func basketballViewTapped() {
        parentVC?.showQuizModule(with: .basketball)
    }
    
    @objc private func mixedViewTapped() {
        parentVC?.showQuizModule(with: .mixed)
    }
}
