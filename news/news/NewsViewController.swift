//
//  ViewController.swift
//  news
//
//  Created by Ruslan Sharshenov on 26.11.2021.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var news: [NewsModel] = []
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = news[indexPath.row]
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailedNewsViewController") as! DetailedNewsViewController
        
        viewController.fill(model: model)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath ) as! NewsCell
        
        let model = news[indexPath.row]
        
        cell.newsTitle.text = model.title
        cell.newsDescriptions.text = model.descriptions
        cell.newsImage.image = UIImage(named: model.image)
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            news.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }

    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        news.append(NewsModel(title: "В Новопокровке из дома украли золото", desctiptions: "«Домушник» совершил 24 ноября в селе Новопокровка. Вор сломал дверь дома местного жителя и вытащил оттуда золотые изделия на 235 тыс. сомов.", image: "NewsPhoto"))
        news.append(NewsModel(title: "В Маевке выявлен факт подкупа голосов", desctiptions: "Установлено, что у двух агитаторов есть специальные бланки для формирования списков избирателей, по которым они выдают денежные средства в размере 1000 сомов за каждый голос.", image: "currupt"))
        news.append(NewsModel(title: "За сутки в Кыргызстане зарегистрировано 12 пожаров", desctiptions: "За сутки в Кыргызстане зарегистрировано 12 пожаров, сообщает Министерство чрезвычайных ситуаций.К их тушению привлечено 13 пожарных частей.", image: "fire"))
        news.append(NewsModel(title: "В ходе рейда изъято 7 единиц оружия", desctiptions: "На территории Ленинского района проверили 79 владельцев огнестрельного оружия, выписано штрафов на 1000 сомов. Изъято и добровольно выданы 7 единицы оружия", image: "guns"))
        news.append(NewsModel(title: "Стрелок из ГБР сдал милиции оружие. Это был сигнальный пистолет", desctiptions: "Сотрудник ГБР устроил беспричинную стрельбу на Чуй—Турусбекова. Инцидент произошел в ночь на 12 ноября. Его действия распространилось по соцсетям.", image: "pm"))
        
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    }
    
    

