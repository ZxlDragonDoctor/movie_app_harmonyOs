// xxx.ets
@Entry
@Component
struct Bofang {
  @State videoSrc: Resource = $rawfile('sishi.mp4')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()

  build() {
    Column() {
      Video({
        src: this.videoSrc,
        currentProgressRate: this.curRate,
        controller: this.controller
      }).width('100%').height(600)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
      Row() {
        Button('播放').onClick(() => {
          this.controller.start()
        }).margin(5)
        Button('暂停').onClick(() => {
          this.controller.pause()
        }).margin(5)
      }
      Row() {
        Button('0.75 倍速').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_0_75_X
        }).margin(5)
        Button('1 倍速').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_1_00_X
        }).margin(5)
        Button('2 倍数').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_2_00_X
        }).margin(5)
      }
    }
  }
}