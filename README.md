# iOS-10 Notifications - All in One

Notifications is a way to inform users when new data becomes available for the app, even when the app is not running in the foreground.

For example, a messaging app might let the user know when a new message has arrived, and a calendar app might inform the user of an upcoming appointment.

With the release of iOS-10, Apple introduces brand new frameworks to support notifications, be it local or remote. Customized notifications is what this release focussed on.

## Frameworks introduced in iOS-10

### User Notifications framework

#### Local notifications

your app configures the notification details locally and passes those details to the system, which then handles the delivery of the notification when your app is not in the foreground. (we tell the system to schedule the notification)

#### Remote notifications

you use one of your company’s servers to push data to user devices via the Apple Push Notification service. For remote notifications, you must also provide a server environment that is capable of receiving data from user devices and sending notification-related data to the Apple Push Notification service (APNs), which is an Apple-provided service that handles the delivery of remote notifications to user devices. (APNs sends the notification to system)

#### Notification service app extensions

you modify the content of remote notifications before they are delivered. If you include a notification service app extension with your app, the system passes incoming notifications to your extension before delivering them to the user.

#### Categoried and Actionable Notification

Instead of the user being forced to launch your app, the interface for an actionable notification displays custom action buttons that the user can tap. When tapped, each button dismisses the notification interface and forwards the selected action to your app for immediate handling. 

### User Notifications UI framework 
customize the appearance of the system’s notification interface.

## Preview
<img src="https://github.com/pgpt10/RichNotificationSample/blob/master/Demo.gif"  width='300' height='534' alt="Preview gif">

## What's in this Project?

This project covers complete implementation details of:

- <b>User Notifications framework</b> for both Local & Remote notifications.
- <b>Actionable Notifications</b> - Configuring Categories and Actions in notifications.
- Scheduling a <b>Local Notification</b>.
- Responding to User Actions.
- Handling <b>Remote Notifications</b> at App End.
- Modification of Remote Notification's payload with <b>Notification Service Extension</b>.
- Creating custom UI using <b>Notification Content Extension</b>.






