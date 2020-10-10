# Newsly - News app using VIPER iOS
> Newsly is a news app fetching data from the "newsApi" and displaying it and few modes.The project was made with Viper Architecture and 100% Programmatic UI.

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Technologies](#technologies)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)

## General info
Newsly app is a news app where you get the latest news, as well as news by categories and also you could save your favourite articles.

## Setup

1. [Get your News API key](https://newsapi.org)

2. Insert your API key into a Constants.swift file and inject it into the project as a struct as shown below

``` swift     
struct Secrets {
    static let APIKey = "YOUR_API_KEY"
}
```

3. [Get your google.plist file](https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjz1-3U16rsAhVE3dUKHXjzD8YYABAAGgJ3cw&ohost=www.google.com&cid=CAESQOD2p4915hCOcLEoSbb3g8Pul5Ed_OrMHAdIzOvSF4d-QNrb_9gousJb398STrH-JqFm4_K2fd2hIM07otFwCsM&sig=AOD64_1owLXQ__dQ4hr-W1rkFRiILT5z-A&q&adurl&ved=2ahUKEwivpuPU16rsAhWFzoUKHV2dAfAQ0Qx6BAggEAE)

4. Inject your google.plist file to your project

5. Run app

## Screenshots
![Example-Movie1](./Newsly/Readme/Movie1-Gif.gif)
![Example-Movie2](./Newsly/Readme/Movie2-Gif.gif)
![Example-Movie3](./Newsly/Readme/Movie3-Gif.gif)
![Example-Movie4](./Newsly/Readme/Movie4-Gif.gif)

## Technologies
* Xcode 12.0
* Swift
* UIKit
* 100% Programmatic UI
* SnapKit
* KingFisher
* Public APIs
* VIPER
* Networking
* Firebase Auth
* Firebase Storage
* Firebase Firestore

## Features
List of features ready and TODOs for future development
* Sign up / Sign in / Sign out including user's image
* Change User photo
* Save favourite articles
* Query from favourite articles
* Discover news by Trending News
* Discover news by Categories
* Discover news by Sources
* Search for specific topic

To-do list:
* Add more alerts to the user

## Status
Project is: _finished_

## Contact
Created by [@ebubedimobi],[@meitarbass] - feel free to contact me!
