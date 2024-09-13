# Polyfill - The Bitwarden Wizard That Fills Windows, Not Just Forms 🔮

Welcome to Polyfill, the script you never knew you needed but absolutely do. If you’ve ever wished that your password
manager could type your credentials straight into a VNC client running in a browser—where there's no traditional input
field—well, dream no more! 🌈✨

Most password managers? They just fill forms like a high schooler copying math homework. But Polyfill? It’s the wizardry
that goes beyond forms and injects your passwords anywhere—even straight into those tricky windows that others dare not
tread. You're welcome. 🎩🧙‍♂️
🤖 What Does It Do?

Polyfill works its magic with the Bitwarden CLI, typing your carefully curated passwords into any window you choose. No,
not just browser input fields (what is this, the early 2000s?)—I'm talking about VNC clients in browsers, desktop apps,
and anywhere else that has the audacity to not provide proper input fields.

Why would you use Polyfill over something like KeePass? Well...

- KeePass? Please. It's like using a flip phone in 2024. You could use it, but why?
- LastPass? Well, let’s just say you’re either very brave or haven’t read the news lately.
- 1Password? Sounds like you’re one step away from using a typewriter.

Bitwarden + Polyfill? Now we’re talking future-ready security with a twist of ✨class✨.

## 🛠 How Does It Work?

Here’s the magic step-by-step:

- Polyfill scans your open windows with the precision of a cat jumping between narrow ledges.
- You select the target window where you want your password to go. No pressure, but if you choose the wrong window...
  well, don't say I didn't warn you. 🙃
- Polyfill fetches your Bitwarden password. Yes, it’s stored safely, thank you for asking.
- Like an invisible butler, it types your password into the selected window (VNC, anyone?) and even presses Enter for
  you.
- You're welcome. 👌

## ⚙️ Features

- Bitwarden CLI integration: Forget about typing your password manually. You’re too important for that.
- Window selection with fzf: Choose your target window like a boss.
- xdotool wizardry: It’s the little gnome that types your password into windows. Who said magic wasn't real? 🧙
- Doesn't support Wayland: Because, honestly, why would you even use Wayland? Go play with your "modern" display server
  somewhere else.

## 🔧 How to Use It

- Install Bitwarden CLI, xdotool, wmctrl, fzf, and jq—you know, all the cool tools.
- Clone this repository. It's like getting backstage passes to a magic show.
- Run Polyfill and watch as it unlocks the doors to password typing heaven. 😇

```bash
./polyfill.sh
```

Follow the prompts, select your window, and voilà! Your password is typed in, hands-free. 🎉

## 📋 Requirements

- Bitwarden CLI: Because it's 2024 and security matters. 🛡
- xdotool: To actually type things for you. Your personal typing gnome. 🤖
- wmctrl: To tell Polyfill where your windows are hiding. 🪟
- fzf: To let you choose the right window in style. 🕶
- jq: For slicing and dicing JSON like a master chef. 🔪

## 🧐 Why Not KeePass?

We know there are some KeePass users lurking here. Let’s be real. Using KeePass to fill a VNC client window is like
trying
to teach a fish to climb a tree. It’s cute that you tried, but this is the 21st century. Time to step up your game.

1Password users? You’re not even part of the conversation, but thanks for coming.
🚀 Future Roadmap

- Wayland Support: Maybe. If we feel like it. Don't hold your breath. 🤷‍♂️
- MacOS Support: Does anyone actually want that? 😂
- Adding Sound Effects: Because why not? Every time Polyfill types a password, let’s add a dramatic "whoosh" or
  "ta-da!" 🎶

## ⚠️ Disclaimer

Polyfill is like a sharp knife—powerful and useful, but only if used correctly. Use responsibly, or you might end up
entering your Bitwarden password into your Slack DMs. 😬 No one needs that kind of drama.

Enjoy! And remember, Bitwarden > everything else.

## License

Licensed under the EUPL. See [LICENSE](./LICENSE) file.
