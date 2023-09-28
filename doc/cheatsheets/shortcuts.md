# Shortcuts

## Shortcuts in VSCode

In VSCode, I have quick keys assigned to Alt+Shift+1 through Alt+Shift+6.

Here's a helpful mapping in VSCode.

    Journal: New Journal Note
    Journal: Open Today
    Search: Focus on Search View
    Source Control: Focus on Source Control View
    Remote Explorer: Foucs on Remotes
    View: Toggle Primary Side Bar Visibility

In my personal Dashboard file

I have a bit of JavaScript in the HTML file I use for my homepage. It causes the above buttons to map to whatever I've set my 6 most visited sites to.

## Shortcuts JavaScript

```html
<!-- Script to jump to links on keypresses 1 through 6 -->
<script src="./jquery-3.7.0.min.js"></script>
<script>
	watch_keys = ['1','2','3','4','5','6'];
	locations = [
		'link here...',
		'link here...',
		'link here...',
		'link here...',
		'link here...',
		'link here...',
	];
  $(document).on("keyup", function (e) {
    if(e.key in watch_keys)
		window.location = locations[parseInt(e.key)-1]
    else {
      console.log(e);
    }
});
</script>
```

## Shortcuts in MS PowerToys

In `Keyboard Manager`, `Remap a Key`:

To Mute/Unmute the `Teams` microphone with the dedicated `Volume Mute` button:

- `Volume Mute` to `Ctrl+Shift+M`

In `Keyboard Manager`, `Remap a Shortcut`:

For `Raise Hand`:

- `Alt+Shift+4` to `Ctrl+Shift+K` in app `teams`
- `Alt+Shift+4` to `Alt+Y` in app `zoom`

For `Mute`:

- `Alt+Shift+6` to `Ctrl+Shift+M` in app `teams`
- `Alt+Shift+6` to `Ctrl+A` in app `zoom`
