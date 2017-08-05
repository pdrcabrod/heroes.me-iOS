//
//  HeroesPresenterTests.swift
//  heroes.me
//
//  Created by Pedro Cabrera Rodriguez on 25/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import XCTest
@testable import heroes_me

class HeroesListViewSpy: HeroesListView {

    var startLoadingCalled = false
    var stopLoadingCalled = false
    var showHeroesCalled = false
    var showErrorStateCalled = false
    var modelViews : [Hero]?
    
    func startLoadingState() {
        startLoadingCalled = true
    }
    
    func stopLoadingState() {
        stopLoadingCalled = true
    }
    
    func showHeroesSection(with values: [Hero]) {
        showHeroesCalled = true
        modelViews = values
    }
    
    func showErrorState() {
        showErrorStateCalled = true
    }
    
}

class HeroesDataSourceSuccessMock: HeroesDataSource {
    
    func getHeroes(completion: @escaping GetHeroesCompletionClosure) {
        let url = URL(string: "http://hola.me")
        let hero = Hero(name: "name", urlToPhoto: url!, realName: "test", power: "test", description: "test")
        completion([hero], nil)
    }
    
}

class HeroesDataSourceErrorMock: HeroesDataSource {
    
    func getHeroes(completion: @escaping GetHeroesCompletionClosure) {
        let error = NSError(domain:"TestDomain", code:-999999, userInfo:nil)
        completion(nil, error)
    }
    
}

class HeroesPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGivenErrorPresenterSendErrorStateToTheView() {
        //given
        //test doubles
        let viewSpy = HeroesListViewSpy()
        let dataSourceMock = HeroesDataSourceErrorMock()
        
        //subjec under test
        let presenter = HeroesListPresenter(heroesDataSource: dataSourceMock)
        presenter.view = viewSpy
        
        //when
        presenter.fetchHeroes()
        
        //then
        XCTAssert(viewSpy.showErrorStateCalled == true, "Presenter should have called showErrorState")
    }
    
    func testGivenSuccessPresentSendMovelViewsToTheView() {
        //given
        //test doubles
        let viewSpy = HeroesListViewSpy()
        let dataSourceMock = HeroesDataSourceSuccessMock()
        
        //subjec under test
        let presenter = HeroesListPresenter(heroesDataSource: dataSourceMock)
        presenter.view = viewSpy
        
        //when
        presenter.fetchHeroes()
        
        //then
        XCTAssert(viewSpy.showHeroesCalled == true, "Presenter should have called showHeroes")
        XCTAssert(viewSpy.modelViews != nil, "Presenter should have sent model views")
    }
    
}
