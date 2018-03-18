# PagedViewContainer

Simple container for paged views.

![Alt Text](https://github.com/achernoprudov/PagedViewContainer/blob/master/Demo/demo.gif)

## Installation

Cocoapods:
```
pod 'PagedViewContainer', '~> 0.2'
```

## Details 

Uses `UIView` not `UIViewController`.
Could be configured throught `PagedViewContainerConfig`.
You could disable some pages at runtime and hide it.

## Usage

Check more examples in /Examples folder.

Configuration:
```
let config = PagedViewContainerConfig(
            pagesBackgroundColor: .white,
            menuBackgroundColor: .lightGray,
            activeItemTextColor: .black,
            inactiveItemTextColor: .gray,
            indicatorColor: .black)
```

Add container to your view:
```
let bestConfig: PagedViewContainerConfig = ...
let greatView: UIView = ...
let awesomeView: UIView = ...

let items = [
   PageItem(title: "Great view", view: greatView),
   PageItem(title: "Awesome view", view: awesomeView)
]

let pagedContainer = PagedViewContainer(config: bestConfig)
pagedContainer.setup(with: items)

yourView.addSubview(pagedContainer)
```

Disable/enable page:
```
pageContainer.set(page: 1, isEnabled: false)
```
