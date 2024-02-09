//
//  TestListViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 09.02.2024.
//

import UIKit

class TestListViewController: UIViewController {
    private let data: [TestBlock]
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "back3")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(TestTableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
        return table
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "quizBackBtn"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    init(data: [TestBlock]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupNotifications() {
        
    }
    
    @objc private func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func calculateCompletedTestNumbers(testBlock: TestBlock) -> String {
        let countOfCompletedQuestions = UserDefaultsManager.fetchCountOfCompletedQuestionsInTest(testBlock: testBlock)
        
        let countOfQuestions = "\(countOfCompletedQuestions)/\(testBlock.test.count)"
        return countOfQuestions
    }
    
    private func setupView() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        backgroundImage.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.size.equalTo(50)
        }
    }
}

extension TestListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        
        cell.configure(cellNumber: indexPath.row + 1, countOfQuestions: calculateCompletedTestNumbers(testBlock: data[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presenter = TestViewPresenter(questions: data[indexPath.row])
        let view = TestViewController(presenter: presenter)
        presenter.view = view
       
        navigationController?.pushViewController(view, animated: true)
    }
}
