# simhelper

Command line tool to quickly open your app database(s) currently running in the Simulator. 

## Usage
```
Usage: sim-helper <app-bundle-id> [--find-database or -f] [--open-with <app-name> or -o <app-name>] 
```
### Get path to the booted simulator's sandbox directory
```
simhelper <com.yourapp.bundleid>
```
### Open booted simulator sandbox directory in Finder
```
simhelper <com.yourapp.bundleid> -o 'Finder'
```

### Search and get path to all databases in your app (sqlite/sql/realm)
```
simhelper <com.yourapp.bundleid> -f
```

### Search and open database files in an app 
```
simhelper <com.yourapp.bundleid> -f -o '<App Name>'
```

## Installation

### [Mint](https://github.com/yonaskolb/mint)
```
$ mint install sehajc/simhelper
```
