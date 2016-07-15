# StackViewTest
A sample project using iOS 9's `UIStackView` along with dynamic height subviews, including multiline labels.

Autolayout seems to do the right thing when change the device's orientation, and `UIStackView` plays nicely with `UIScrollView` so that when the content no longer fits the screen, the scrolling interaction is enabled.

## Dealing with multiline labels
- call `layoutIfNeeded()` on the multiline label every time its content changes (i.e. the `text` attribute changes)
- I had to subclass `UILabel` and do the following:
	
	```
	override func layoutSubviews() {
        super.layoutSubviews()
        preferredMaxLayoutWidth = bounds.size.width
        super.layoutSubviews()
    }
	```
	Otherwise, the lines will grow in width and never wrap. Setting an explicit Max Layout Width in the Interface Builder seems to fix it as well, but it would end up with a wrong value for different devices.