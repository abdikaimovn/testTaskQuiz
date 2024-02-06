//
//  ProfileView.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 06.02.2024.
//

import UIKit
import SnapKit
import Foundation

protocol ProfileViewDelegate: AnyObject {
    func showInitialView()
    func showUpdateUserInfoView()
}

final class ProfileView: UIView {
    weak var parentVC: ProfileViewDelegate?
    
    private let presenter = ProfilePresenter()
    
    private lazy var servicesTableView: UITableView = {
        let table = SelfSizingTableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        table.register(ServicesTableViewCell.self, forCellReuseIdentifier: "ServicesTableViewCell")
        table.register(NotificationsTableViewCell.self, forCellReuseIdentifier: "NotificationsTableViewCell")
        return table
    }()
    
    private let infoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "nameView")
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let userInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let genderLabel = UILabel()
    
    private let userInfoValuesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private let username = UILabel()
    private let userAge = UILabel()
    private let userGender = UILabel()
    
    private lazy var changeUserInfoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "changeUser"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(updateUserDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let canvasView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "deleteBtn"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(deleteDidTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        presenter.view = self
        
        presenter.viewDidLoaded()
        setupNotificationCenter()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateUser),
            name: Notification.Name("UpdateAfterChanges"),
            object: nil
        )
    }
    
    @objc private func updateUser() {
        presenter.updateUserInfo()
    }
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc private func deleteDidTapped() {
        presenter.deleteButtonTapped()
    }
    
    @objc private func updateUserDidTapped() {
        parentVC?.showUpdateUserInfoView()
    }
    
    private func setupUserInfoStack() {
        [nameLabel, ageLabel, genderLabel].forEach { label in
            label.textColor = .white
            label.font = UIFont.font(style: .title, size: 20)
        }
        
        userInfoStack.addArrangedSubview(nameLabel)
        userInfoStack.addArrangedSubview(ageLabel)
        userInfoStack.addArrangedSubview(genderLabel)
        
        nameLabel.text = "NAME:"
        ageLabel.text = "AGE:"
        genderLabel.text = "GENDER:"
    }
    
    private func setupUserInfoValuesStack() {
        [username, userAge, userGender].forEach { label in
            label.textColor = .orangeColor
            label.font = UIFont.font(style: .body, size: 23)
        }
        
        userInfoValuesStack.addArrangedSubview(username)
        userInfoValuesStack.addArrangedSubview(userAge)
        userInfoValuesStack.addArrangedSubview(userGender)
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(servicesTableView)
        servicesTableView.setContentCompressionResistancePriority(.required, for: .vertical)
        servicesTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(servicesTableView.snp.bottom).offset(20)
        }
        
        infoView.addSubview(canvasView)
        canvasView.snp.makeConstraints { make in
            make.edges.greaterThanOrEqualToSuperview().inset(30)
            make.center.equalToSuperview()
        }
        
        canvasView.addSubview(userInfoStack)
        userInfoStack.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }
        setupUserInfoStack()
        
        canvasView.addSubview(userInfoValuesStack)
        userInfoValuesStack.setContentCompressionResistancePriority(.required, for: .horizontal)
        userInfoValuesStack.snp.makeConstraints { make in
            make.leading.equalTo(userInfoStack.snp.trailing).offset(20)
            make.top.bottom.equalToSuperview()
        }
        setupUserInfoValuesStack()
        
        canvasView.addSubview(changeUserInfoButton)
        changeUserInfoButton.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(userInfoValuesStack.snp.trailing).offset(10)
            make.trailing.bottom.equalToSuperview()
            make.size.equalTo(30)
        }
        
        addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(50)
            make.bottom.lessThanOrEqualToSuperview().inset(10)
        }
    }
}

extension ProfileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsTableViewCell", for: indexPath) as! NotificationsTableViewCell
            cell.configure(serviceName: "Notifications")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as! ServicesTableViewCell
            cell.configure(serviceName: "Rate Us")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as! ServicesTableViewCell
            cell.configure(serviceName: "Leave Feetback")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as! ServicesTableViewCell
            cell.configure(serviceName: "Privacy Policy")
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as! ServicesTableViewCell
            cell.configure(serviceName: "Terms of Use")
            return cell
        default:
            return UITableViewCell(frame: .zero)
        }
    }
}

extension ProfileView: ProfileViewProtocol {
    func showInitialView() {
        parentVC?.showInitialView()
    }
    
    func showUserInfo(userInfo: UserModel) {
        username.text = userInfo.name?.uppercased()
        userAge.text = String(userInfo.age!)
        userGender.text = userInfo.gender.rawValue.uppercased()
    }
}
