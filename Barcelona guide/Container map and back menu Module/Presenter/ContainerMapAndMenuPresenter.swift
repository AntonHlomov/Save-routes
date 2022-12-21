//
//  ContainerMapAndMenuPresenter.swift
//  Barcelona guide
//
//  Created by Anton Khlomov on 19/12/2022.
//

import Foundation

protocol MenuViewProtocol: AnyObject{
    func clouse()
}

protocol ContainerMapAndMenuProtocol: AnyObject{
    func sucses()
    func failure(error: Error)
    func setUser(user: User)
    func showMenuViewController(shouldMove: Bool)
}

protocol ContainerMapAndMenuPresenterProtocol: AnyObject{
    init(view: ContainerMapAndMenuProtocol,viewMapa:ContainerMapAndMenuProtocol,viewMenuMapa:MenuViewProtocol,networkService: RequestsObjectsApiProtocol, router:RouterProtocol)
    
    var user: User? {get set}
    var favoritOjects: [Object]? {get set}
    func getData()
    func openSettingsUser()
    func goToCollectionLocation()
    func showAddNewOject()
    func toggleMenu()
    func contacts()
    
    func menuConecter(index: IndexPath)
}
    
class ContainerMapAndMenuPresenter: ContainerMapAndMenuPresenterProtocol{
    weak var view: ContainerMapAndMenuProtocol?
    weak var viewMapa: ContainerMapAndMenuProtocol?
    weak var viewMenuMapa: MenuViewProtocol?
    let networkService: RequestsObjectsApiProtocol!
    var router: RouterProtocol?
    var favoritOjects: [Object]?
    var isMove: Bool
    var user: User? {
        didSet {
            print("User chenging!")
            guard user != nil else{return}
            self.viewMapa?.setUser(user: user!)
        }
    }
    
    required init(view: ContainerMapAndMenuProtocol,viewMapa:ContainerMapAndMenuProtocol,viewMenuMapa:MenuViewProtocol,networkService: RequestsObjectsApiProtocol, router:RouterProtocol){
        
        self.view = view
        self.viewMapa = viewMapa
        self.viewMenuMapa = viewMenuMapa
        self.router = router
        self.networkService = networkService
        self.favoritOjects = [Object]()
        
        self.isMove = false
        getData()
    }
    
    func menuConecter(index: IndexPath){
        switch index.row{
        case 0://Profile
            return
        case 1://Menu
            return
        case 2: //Contacts
            toggleMenu()
            self.router?.showChatUsers(user: self.user)
            return
        case 3://Settings
            return
            
        default:
            break
        }
        
    }
    func contacts() {
        self.viewMenuMapa?.clouse()
    }
    func toggleMenu() {
        self.isMove = !self.isMove
        self.viewMapa?.showMenuViewController(shouldMove:self.isMove)
    }
    func showAddNewOject(){
        self.router?.showAddNewOject(user: self.user)
    }
    func goToCollectionLocation(){
        print("User collectionLoc!")
        self.router?.showCollectionLocations()
    }
    func openSettingsUser(){
        self.router?.showChatUsers(user: self.user)
    }
    // Geting data
    func getData(){
        print("Geting data")
        self.user = userCache
    }
}
    
