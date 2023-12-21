# MPV Video Clip Saver

This Lua script for MPV allows you to create video clips with custom start and end offsets. It utilizes ffmpeg to extract the desired portion of the video and save it as a separate clip.

*Please note that this script is a beginner's attempt at Lua scripting and may contain bugs or room for improvements (and might be updated later).*

## Installation

1. Download the `mpv-clip-saver.lua` file and place it to your MPV scripts directory.
2. Open your MPV configuration file (usually located at `~/.config/mpv/mpv.conf` or `%APPDATA%\mpv\mpv.conf`) and add the following line:

```lua
lua-load=mpv-clip-saver.lua
```

## Usage
1. Open a video file in MPV.
2. Press the "c" key to create a video clip.
3. The script will capture the current playback position and create a clip with a specified start and end offset.
4. The clip will be saved in the same directory as the main video file.

## Customization

You can customize the following parameters in the script:

- `startOffset`: Adjusts the start offset of the clip in seconds.
- `endOffset`: Adjusts the end offset of the clip in seconds.

To modify these parameters, open the `mpv-clip-saver.lua` file in a text editor and update the values accordingly.

## Known Issues

- The clip counter resets to 1 after closing and reopening the same video file.
- The MPV console displays a strange error message after each action, but the clip is still successfully saved.

