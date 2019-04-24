# gravity-group-music
iOS Test Assignment for position @ Gravity Group

# ✅ Done
- Nearly identical with [Zeplin project](https://mandrillapp.com/track/click/30339184/app.zeplin.io?p=eyJzIjoiYWlqMFlVdDhUbkpuNFJzVUJDTUd3bU95UXVvIiwidiI6MSwicCI6IntcInVcIjozMDMzOTE4NCxcInZcIjoxLFwidXJsXCI6XCJodHRwczpcXFwvXFxcL2FwcC56ZXBsaW4uaW9cXFwvcHJvamVjdFxcXC81ODIzOTMwZDIzYTY5YWUwMGViODEwMzJcIixcImlkXCI6XCJhNGNhODU3YWIwZGY0MzI0YTFlMjlmYzdhMDM4YTg5NFwiLFwidXJsX2lkc1wiOltcImYzNDdlNzU0MTViNWUxNWMxOGNlMGZkODhlYTc1NjYzZjJmOWVmY2JcIl19In0) UI
- Own WEB hosting instead of unstable FMA (houses images and mp3 files)
- Network module
- MP3 playback
- Good Architecture: models, views, child view controllers, extensions, observer pattern, reusable views (i.e. PlayButton, SelfSizingTableView), data source protocol (repository pattern)
- Lock screen remote control and background playback

# 📈 Things I would improve
## Major
- Sound prefetch to avoid waiting several seconds before playback actually starts
- LoadingStateViewController: the one would display loaders, errors if occurred along with retry button. + Data request errors handling.
- There is some stuff to refactor. For example force unwrapping abuse,

## Minor
- In app volume control does not work yet
- In app playback time of a track is not updated
- UX improvement: it would be more convenient if the whole cell in the list triggered song pausing/resuming, not just small play/pause button
