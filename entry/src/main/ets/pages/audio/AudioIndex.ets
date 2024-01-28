import media from '@ohos.multimedia.media'
import { StandardButton } from '../../view/StandardButton'

@Entry
@Component
struct AudioIndex {
  private avPlay?: media.AVPlayer

  build() {
    Column() {
      StandardButton({name: '初始化'})
        .onClick(() => {
          this.initAvPlay()
        })
      StandardButton({name: '播放'})
        .onClick(() => {
          this.play()
        })
      StandardButton({name: '暂停'})
        .onClick(() => {
          this.pause()
        })
      StandardButton({name: '快进10秒'})
        .onClick(() => {
          this.seekTime()
        })
      StandardButton({name: '设置音量'})
        .onClick(() => {
          this.setVolume()
        })
      StandardButton({name: '设置倍速'})
        .onClick(() => {
          this.setSpeed()
        })
      StandardButton({name: '停止'})
        .onClick(() => {
          this.stop()
        })
      StandardButton({name: '重置'})
        .onClick(() => {
          this.reset()
        })
    }.width('100%')
  }

  async initAvPlay() {
    // 创建av对象
    this.avPlay = await media.createAVPlayer()
    this.avPlay.url = "https://xxx.xxx.com/xxx.mp3"
    this.avPlay.prepare()
  }

  play() {
    this.avPlay?.play()
  }

  pause() {
    this.avPlay?.pause()
  }

  seekTime() {
    let currentTime = this.avPlay?.currentTime ?? 0
    this.avPlay?.seek(currentTime + (10 * 1000), media.SeekMode.SEEK_PREV_SYNC)
  }

  setVolume() {
    this.avPlay?.setVolume(1.0)
  }

  setSpeed() {
    this.avPlay?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X)
  }

  stop() {
    this.avPlay?.stop()
    this.avPlay?.release()
  }

  reset() {
    this.avPlay?.reset()
  }
}