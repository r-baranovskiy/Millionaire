import UIKit


class ScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
    private let scoreManager = ScoreManager()
    
	let gameResults = ["Game 1", "Game 2", "Game 3", "Game 4", "Game 5"]
		
	let logoView: UIImageView = {
		let logoImage = UIImageView()
		logoImage.image = UIImage(named: "logoLarge")
		logoImage.translatesAutoresizingMaskIntoConstraints = false
		return logoImage
	}()
	
	let headerLabelView: UILabel = {
		let label = UILabel()
		label.text = "Результаты игр"
		label.font = UIFont(name: "Poppins-SemiBold", size: 28)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let tableView: UITableView = {
		let table = UITableView()
		table.translatesAutoresizingMaskIntoConstraints = false
		return table
	}()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
		view.backgroundColor = .black
		setBackground()
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        deleteLastSave()
		
		//Добавление блоков с элементами
		view.addSubview(logoView)
		view.addSubview(headerLabelView)
		view.addSubview(tableView)
        view.addSubview(backButton)
		tableView.register(ScoreTableViewCell.self, forCellReuseIdentifier: ScoreTableViewCell.identifier)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.backgroundColor = UIColor.clear
		tableView.separatorStyle = .none
		tableView.separatorColor = .clear
		
		// Добавление констрейнтов для блоков
		logoViewConstraints()
		headerLabelViewConstraints()
		tableViewConstraints()
        backButtonConstraints()
		
		super.viewDidLoad()
	}
    
    @objc
    private func backButtonPressed() {
        let vc = StartViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func deleteLastSave() {
        if scoreManager.getAllSaves().count > 10 {
            let scoreToDelete = scoreManager.getAllSaves()[10]
            scoreManager.delete(score: scoreToDelete)
        }
    }
	
	func setBackground() {
		let background = UIImage(named: "backgroundBlue")
		var imageView : UIImageView!
		imageView = UIImageView(frame: view.bounds)
		imageView.contentMode =  UIView.ContentMode.scaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = background
		imageView.center = view.center
		view.addSubview(imageView)
		self.view.sendSubviewToBack(imageView)
	}
	
	
	func logoViewConstraints() {
		logoView.widthAnchor.constraint(equalToConstant: 250).isActive = true
		logoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
		logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
	}
	
	func headerLabelViewConstraints() {
		headerLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		headerLabelView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40).isActive = true
	}
	
	func tableViewConstraints() {
		tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		tableView.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant: 30).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
	}
    
    func backButtonConstraints(){
        backButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 5).isActive = true
        backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ScoreTableViewCell.identifier, for: indexPath) as? ScoreTableViewCell else { return UITableViewCell()
		}
        let score = scoreManager.getAllSaves()[indexPath.row]
		cell.cellConfigure(with: score)
		cell.backgroundColor = .clear
		cell.textLabel?.textColor = .white
		cell.isUserInteractionEnabled = false
//		cell.contentView.alpha = 0.5
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreManager.getAllSaves().count
	}
}

