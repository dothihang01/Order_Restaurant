//
//  Order_Restaurant_Model.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 22/10/2022.
//

import Foundation
import UIKit

class Category {
    var categoryId: Int
    var categoryName: String
    init(categoryId: Int, categoryName: String) {
        self.categoryId = categoryId
        self.categoryName = categoryName
    }
}


class Food {
    var foodId: Int
    var foodName: String
    var foodPrice: Int
    var foodDescription: String
    var foodImage: String
    var foodAmount: Int = 0
    var foodTime: String
    var foodCategory: String
    var numberOfOrder: Int = 0
    init(foodId: Int, foodName: String, foodPrice: Int, foodDescription: String, foodImage: String, foodAmount: Int, foodTime: String, foodCategory: String, numberOfOrder: Int) {
        self.foodId = foodId
        self.foodName = foodName
        self.foodPrice = foodPrice
        self.foodDescription = foodDescription
        self.foodImage = foodImage
        self.foodAmount = foodAmount
        self.foodTime = foodTime
        self.foodCategory = foodCategory
        self.numberOfOrder = numberOfOrder
    }
}

class Table {
    var numberTable: Int
    init(numberTable: Int) {
        self.numberTable = numberTable
    }
}

class Order {
    var orderId: Int
    var orderTable: Int
    var orderTotalPrice: Double
    var orderDate: Double
    var table: Table?
    
    init(orderId: Int, orderTable: Int, orderTotalPrice: Double, orderDate: Double, table: Table?) {
        self.orderId = orderId
        self.orderTable = orderTable
        self.orderTotalPrice = orderTotalPrice
        self.orderDate = orderDate
        self.table = table
    }
}

class Customer {
    var customerId: Int
    var customerName: String
    var customerDob: String
    var customerGender: String
    init(customerId: Int, customerName: String, customerDob: String, customerGender: String) {
        self.customerId = customerId
        self.customerName = customerName
        self.customerDob = customerDob
        self.customerGender = customerGender
    }
}

class Restaurant {
    var restaurantId: Int
    var restaurantName: String
    var restaurantAddress: String
    var restaurantDescription: String
    var restaurantImage: String
    var numberOfVisit: Int
    var logoRes: String
    var typeAccount: Int
    var location: Int
    var food: [Food]
    var table: [Table]
    init(restaurantId: Int, restaurantName: String, restaurantAddress: String, restaurantDescription: String, restaurantImage: String, numberOfVisit: Int, typeAccount: Int, logoRes: String, location: Int, food: [Food], table: [Table]) {
        self.restaurantId = restaurantId
        self.restaurantName = restaurantName
        self.restaurantAddress = restaurantAddress
        self.restaurantDescription = restaurantDescription
        self.restaurantImage = restaurantImage
        self.numberOfVisit = numberOfVisit
        self.typeAccount = typeAccount
        self.logoRes = logoRes
        self.location = location
        self.food = food
        self.table = table
    }
}

class Bill {
    var billId: Int
    var billStatus: String
    
    init (billId: Int, billStatus: String) {
        self.billId = billId
        self.billStatus = billStatus
    }
}

class Account {
    var accountId: Int
    var accountName: String
    var password: String
    var typeAccount: Int
    init(accountId: Int, accountName: String, password: String, typeAccount: Int) {
        self.accountId = accountId
        self.accountName = accountName
        self.password = password
        self.typeAccount = typeAccount
    }
}

class RegisterCustomer {
    var account: [Account]
    init(account: [Account]) {
        self.account = account
    }
}

class AccountLogin {
    var account: [Account]
    init(account: [Account]) {
        self.account = account
    }
}
