//import UIKit
//
//
//class ScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//	let gameResults = ["Game 1", "Game 2", "Game 3", "Game 4", "Game 5"]
//
//
//	let logoView: UIImageView = {
//		let logoImage = UIImageView()
//		logoImage.image = UIImage(named: "logoLarge")
//		logoImage.translatesAutoresizingMaskIntoConstraints = false
//		return logoImage
//	}()
//
//	let headerLabelView: UILabel = {
//		let label = UILabel()
//		label.text = "Результаты игр"
//		label.font = UIFont(name: "Poppins-SemiBold", size: 28)
//		label.textColor = .white
//		label.translatesAutoresizingMaskIntoConstraints = false
//		return label
//	}()
//
//	let tableView: UITableView = {
//		let table = UITableView()
//		table.translatesAutoresizingMaskIntoConstraints = false
//		return table
//	}()
//
//
//
//	override func viewDidLoad() {
//		view.backgroundColor = .black
//		setBackground()
//
//		//Добавление блоков с элементами
//		view.addSubview(logoView)
//		view.addSubview(headerLabelView)
//		view.addSubview(tableView)
//		tableView.register(ScoreTableViewCell.self, forCellReuseIdentifier: ScoreTableViewCell.identifier)
//		tableView.dataSource = self
//		tableView.delegate = self
//		tableView.backgroundColor = UIColor.clear
//		tableView.separatorStyle = .none
//		tableView.separatorColor = .clear
//
//
//
//		// Добавление констрейнтов для блоков
//		logoViewConstraints()
//		headerLabelViewConstraints()
//		tableViewConstraints()
//
//
//		super.viewDidLoad()
//
//	}
//
//	func setBackground() {
//		let background = UIImage(named: "backgroundBlue")
//		var imageView : UIImageView!
//		imageView = UIImageView(frame: view.bounds)
//		imageView.contentMode =  UIView.ContentMode.scaleAspectFill
//		imageView.clipsToBounds = true
//		imageView.image = background
//		imageView.center = view.center
//		view.addSubview(imageView)
//		self.view.sendSubviewToBack(imageView)
//	}
//
//
//	func logoViewConstraints() {
//		logoView.widthAnchor.constraint(equalToConstant: 250).isActive = true
//		logoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//		logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//	}
//
//	func headerLabelViewConstraints() {
//		headerLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		headerLabelView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40).isActive = true
//	}
//
//	func tableViewConstraints() {
//		tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
//		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
//		tableView.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant: 30).isActive = true
//		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
//	}
//
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//	}
//
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		guard let cell = tableView.dequeueReusableCell(withIdentifier: ScoreTableViewCell.identifier, for: indexPath) as? ScoreTableViewCell else { return UITableViewCell()
//		}
//		cell.cellConfigure(game: "Игра \(indexPath.row+1)", result: "1000₽")
//		cell.backgroundColor = .clear
//		cell.textLabel?.textColor = .white
//		cell.isUserInteractionEnabled = false
////		cell.contentView.alpha = 0.5
//		return cell
//	}
//
//	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		gameResults.count
//	}
//
//}
//
