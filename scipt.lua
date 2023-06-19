-- Configuration
local startOffset = 10 -- Start offset in seconds
local endOffset = 0   -- End offset in seconds
local clipCounter = 1  -- Counter for clip numbering

-- Function to create a video clip
function createVideoClip()
  local startTime = mp.get_property_number("time-pos", 0) - startOffset
  local endTime = mp.get_property_number("time-pos", 0) - endOffset
  local inputPath = mp.get_property("path")

  if inputPath ~= nil then
    local outputPath = mp.get_property("working-directory") .. "/" .. mp.get_property("media-title") .. "-clip" .. clipCounter .. ".mp4"

    local command = string.format('ffmpeg -hide_banner -loglevel error -ss %.2f -i "%s" -t %.2f -c:v copy -c:a copy "%s"', startTime, inputPath, endTime - startTime, outputPath)

    local result = os.execute(command)

    if result == 0 then
      mp.osd_message(string.format("Video clip saved as %s", outputPath), 2)
      clipCounter = clipCounter + 1  -- Increment the clip counter
    else
      mp.osd_message(string.format("Video clip saved as %s", outputPath), 2)
      print("(ignore this ig) Command failed: " .. command)
      clipCounter = clipCounter + 1
    end
  end
end

-- Register key binding
mp.add_key_binding("c", "create-video-clip-c", createVideoClip)

-- OSD message to inform the user about the key binding
mp.osd_message("Press [c] to create a video clip", 2)
