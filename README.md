# StackViewTest
A sample project using iOS 9's `UIStackView` along with dynamic height subviews, including multiline labels.

Autolayout seems to do the right thing when changing the device's orientation, and `UIStackView` plays nicely with `UIScrollView` so that when the content no longer fits the screen, the scrolling interaction is enabled.

There're some differences between `UIStackView` and classic components like `UITableView`, some of them can be seen [here](http://angelolloqui.com/blog/36-Oddities-of-UIStackView).
It is worth mentioning that:

- `UIStackView`s do not have a normal render phase. So things like `backgroundColor` or border attributes won't work. You have to wrap your `UIStackView` within a container.
- `addArrangedSubview` also adds the view as a subview, but `removeArrangedSubview` doesn't, so you have to call `removeFromSuperview` otherwise you'll end up with tons of subviews still living in memory.


## Dealing with multiline labels
- Call `layoutIfNeeded()` on the multiline label every time its content changes (i.e. the `text` attribute changes)
- I had to subclass `UILabel` and do the following ([seen here](https://www.objc.io/issues/3-views/advanced-auto-layout-toolbox/#intrinsic-content-size-of-multi-line-text)):
	
	```
	override func layoutSubviews() {
        super.layoutSubviews()
        preferredMaxLayoutWidth = bounds.size.width
        super.layoutSubviews()
    }
	```
	Otherwise, the lines might grow in width and not wrap (not always reproducible). Setting an explicit Max Layout Width in the Interface Builder seems to fix it as well, but it would end up with a wrong value for different devices.
	
## Parallax effect when overscrolling

The well known "parallax effect" when a `UITableView`/`UIScrollView` header with a background image sees its image scaling up as the user overscrolls is quite easy to implement, and there are several solutions out there:

- Using a `transform`
- Tweaking the image's `frame`

Both solutions are achieved through some calculation based on the `contentOffset` from: 

- [`scrollViewDidScroll(_ scrollView: UIScrollView)`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIScrollViewDelegate_Protocol/#//apple_ref/occ/intfm/UIScrollViewDelegate/scrollViewDidScroll:)

However, more elegant solutions completely ditch this calculation along with the delegate method and achieve the same behaviour simply using Auto-layout constraints. But they usually mean having the header outside the `UIScrollView`.

This is fine if you never need user interaction in the header, it will go through to the `UIScrollView` and allow users to scroll through your header. But if you need to interact with the header as well, things get harder.

To avoid this issue and still have the parallax effect you can keep the header inside the `UIScrollView` but pin its top to the top layout guide, rather than the `superview` (in this case `UIScrollView`):

![topLayoutGuide](https://dl.dropboxusercontent.com/u/2521373/topLayoutGuide.png)

After that, by pinning the bottom of the header to the top of the `UIScrollView`'s next child, along with setting `scaleAspectFill` as the image's `contentMode`, you should achieve the parallax effect.

- This will keep your Header pinned to the top of the view, even while users overscroll.
- This will also respect your remaining constraints (e.g. in child views) while using a `transform` or meddling with the `frame` might not.
- Finally, you can still interact with the header (e.g. a button, a swipe gesture in a carrousel, etc) because it is part of the `UIScrollView`, so you get `UIScrollView`'s handling for free.

This is how it looks like:

![ParallaxEffect](http://i.giphy.com/l0HlvgwBwZFW3YVKE.gif)


<del><b>Note:</b> At the moment, using Xcode 8 beta 2 and iOS 10 this solution seems broken. Basically pinning the header to the `topLayoutGuide` is not having the desired effect and the Parallax Effect is lost, even though it works fine in iOS 9.
I'm not sure whether this is a bug in Auto-layout that might get fixed in the future or not. (27388993)

</br></br>A possible workaround is to use `Top Space to View Margin` rather than `Top Layout Guide`.
</del>

**Update:** Bug 27388993 has been fixed in Xcode 8 beta 4.
