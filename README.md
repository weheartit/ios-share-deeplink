# Share Images To We Heart It

This project is an example of how you can share images from your own app directly to We Heart It app, by using deep links.

## Example

```swift
let url = NSURL(string: "whi://")!
let isInstalled = UIApplication.sharedApplication().canOpenURL(url)

// If the app isn't installed, send user to the App Store
if !isInstalled {
	let url = NSURL(string: "itms-apps://itunes.apple.com/ca/app/whi/id539124565?mt=8")!
    UIApplication.sharedApplication().openURL(url)

// Otherwise, we are good to go
} else {

	// Put some image in the clipboard image property
    let image = UIImage(named: "Dog")
    UIPasteboard.generalPasteboard().image = image
        
    // Open WHI app
    let url = NSURL(string: "whi://native_share?tags=foo,bar,baz&caption=Caption%20of%20Image&via=MyApp")!
    UIApplication.sharedApplication().openURL(url)
}
```

## Parameters

- **via** (required): this is your application name. Important: we will need to whitelist your app name. Please contact us at hello@weheartit.com
- **tags**: this is some tags about the image. User will be able to edit it before upload the image
- **caption**: this is the title of the image. User will alsobe be able to edit it before upload the image
