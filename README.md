StorenvySDK-Example
===================

Install cocoapods if necessary

> pod install

> open StorenvyApp.xcworkspace

There might be some strange things with the Pod config where ARC is not enabled by default. 
Right now you need to fix this by hand in the Pods subproject
- (Project) Pods -> build settings: set ARC to YES
- (target) Pods-StorenvySDK-SOCKit: set ARC to NO
- (target) Pods-StorenvySDK-ReactiveCocoa -> build phases: set the -fno-objc-arc flag for the RACObjCRuntime.m file
