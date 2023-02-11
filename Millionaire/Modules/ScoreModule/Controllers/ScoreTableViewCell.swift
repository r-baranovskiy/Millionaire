//
//  ScoreTableViewCell.swift
//  Millionaire
//
//  Created by Karim Ibragimov on 11.02.2023.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
	
	static let identifier = "ScoreTableViewCell"
	
	//Лейбл с номером игры
	let nameLabel: UILabel = {
			let label = UILabel()
			label.font = UIFont(name: "Poppins-Regular", size: 16)
			label.textColor =  .white
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = "Результат"
			return label
	}()
	
	//Лейбл с суммой выигрыша
	let scoreLabel: UILabel = {
			let label = UILabel()
			label.font = UIFont(name: "Poppins-Regular", size: 16)
			label.textColor =  .white
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = "1000Р"
			label.textAlignment = .right
			return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.backgroundColor = .bottomColor()
		contentView.layer.cornerRadius = 20
		contentView.addSubview(nameLabel)
		contentView.addSubview(scoreLabel)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func cellConfigure (game: String, result: String) {
		nameLabel.text = game
		scoreLabel.text = result
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		nameLabel.text = nil
		scoreLabel.text = nil
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		nameLabel.frame = CGRect(x: 30,
								 y: 0,
								 width: contentView.frame.size.width / 2,
								 height: contentView.frame.size.height)
		scoreLabel.frame = CGRect(x: nameLabel.frame.size.width,
								 y: 0,
								 width: contentView.frame.size.width / 2 - 30,
								 height: contentView.frame.size.height)
	}
	
	//Добавление отступов после ячеек
	override var frame: CGRect {
		get {
			return super.frame
		}
		set (newFrame) {
			var frame =  newFrame
			frame.origin.y += 4
			frame.size.height -= 1 * 5
			super.frame = frame
		}
	  }
	
	

}
