//
//  MainViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 04.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    private var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let homeView = HomeView()
    private var statisticsView = StatisticsView()
    private let profileView = ProfileView()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "homeBackground")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGrayColor
        let image = UIImage(named: "home")
        button.setImage(image?.resized(to: CGSize(width: 35, height: 35)), for: .normal)
        button.addTarget(self, action: #selector(homeDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var statisticsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGrayColor
        let image = UIImage(named: "statistics")
        button.setImage(image?.resized(to: CGSize(width: 40, height: 20)), for: .normal)
        button.addTarget(self, action: #selector(statisticsDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGrayColor
        let image = UIImage(named: "profile")
        button.setImage(image?.resized(to: CGSize(width: 35, height: 40)), for: .normal)
        button.addTarget(self, action: #selector(profileDidTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        profileView.parentVC = self
        homeView.parentVC = self
    }
    
    @objc private func homeDidTapped() {
        handleButtonShadows(homeButton)
        handleMainView(homeButton)
    }
    
    @objc private func statisticsDidTapped() {
        handleButtonShadows(statisticsButton)
        handleMainView(statisticsButton)
    }
    
    @objc private func profileDidTapped() {
        handleButtonShadows(profileButton)
        handleMainView(profileButton)
    }
    
    private func handleButtonShadows(_ sender: UIButton) {
        switch sender{
        case homeButton:
            statisticsButton.layer.shadowOpacity = 0
            profileButton.layer.shadowOpacity = 0
        case statisticsButton:
            homeButton.layer.shadowOpacity = 0
            profileButton.layer.shadowOpacity = 0
        case profileButton:
            statisticsButton.layer.shadowOpacity = 0
            homeButton.layer.shadowOpacity = 0
        default:
            break
        }
        
        sender.layer.shadowOpacity = 1
    }
    
    private func handleMainView(_ sender: UIButton) {
        switch sender{
        case homeButton:
            homeView.isHidden = false
            statisticsView.isHidden = true
            profileView.isHidden = true
            backgroundImage.image = UIImage(named: "homeBackground")
        case statisticsButton:
            statisticsView.isHidden = false
            homeView.isHidden = true
            profileView.isHidden = true
            backgroundImage.image = UIImage(named: "statisticsBackground")
        case profileButton:
            profileView.isHidden = false
            statisticsView.isHidden = true
            homeView.isHidden = true
            backgroundImage.image = UIImage(named: "profileBackground")
        default:
            break
        }
    }
    
    private func setupMainView() {
        mainView.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainView.addSubview(statisticsView)
        statisticsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainView.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        statisticsView.isHidden = true
        profileView.isHidden = true
    }
    
    private func setupView() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        backgroundImage.addSubview(stackView)
        
        stackView.addArrangedSubview(homeButton)
        stackView.addArrangedSubview(statisticsButton)
        stackView.addArrangedSubview(profileButton)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            make.height.equalTo(70)
        }
        
        stackView.distribution = .equalCentering
        
        [homeButton, statisticsButton, profileButton].forEach { button in
            button.snp.makeConstraints { make in
                make.size.equalTo(70)
            }
            
            button.layer.shadowColor = UIColor.orangeColor.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 10
            button.imageView?.contentMode = .scaleAspectFit
            button.layer.cornerRadius = 35
            button.layer.cornerCurve = .continuous
        }
        
        statisticsButton.layer.shadowOpacity = 0
        profileButton.layer.shadowOpacity = 0
        
        setupMainView()
    }
    
}

extension MainViewController: ProfileViewDelegate {
    func showUpdateUserInfoView() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(UpdateUserViewController(), animated: true)
    }
    
    func showInitialView() {
        sceneDelegate?.showInitialViewController()
    }
}

extension MainViewController: HomeViewDelegate {
    func showQuizModule(with type: ModuleType) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(QuizMainViewController(moduleType: type), animated: true)
    }
}
