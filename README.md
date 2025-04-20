# AlertViewModifiersDemo

A SwiftUI project demonstrating reusable, composable view modifiers for presenting custom alerts.

## The Problem

SwiftUI’s native `.alert` view modifier can become repetitive and rigid when you want to:

- Show a simple alert with a button.
- Customize alert content beyond a basic message.
- Collect user input (using text fields) inside an alert.

Manually managing `isPresented` booleans and duplicating `.alert` logic across views makes code harder to maintain.

## Common Scenario

- You want to show a simple confirmation alert across multiple screens.
- You need a text field inside an alert to update user information.
- You want reusable, composable alert logic without cluttering your views.

## This Project’s Solution

This demo introduces a set of SwiftUI view modifiers to simplify and extend alert usage:

### `showingAlert`

```swift
.showingAlert("Title", message: "Message", isPresented: $isPresented)
```
- Displays a basic alert with a customizable button and optional completion action.

---

### `customAlert`

```swift
.customAlert("Message", isPresented: $isPresented) {
    // Custom view content inside the alert
    Button("Confirm") { }
}
```
- Injects custom SwiftUI views into an alert for more flexible interactions.

---

### `singleFieldAlert`

```swift
.singleFieldAlert("Enter name", isPresented: $isPresented) { text in
    // Handle text input
}
```
- Presents an alert with a text field, captures user input, and clears the field automatically when dismissed.

---

## Demo Project Includes

Two sections showcasing:

- A simple alert using `showingAlert`.
- A text field alert using `singleFieldAlert` to update user information.

This demo mirrors real-world use cases where clean, reusable alert presentation improves SwiftUI apps.

This modifier is part of [NnSwiftUIKit](https://github.com/nikolainobadi/NnSwiftUIKit), a collection of custom SwiftUI view modifiers and utilities.