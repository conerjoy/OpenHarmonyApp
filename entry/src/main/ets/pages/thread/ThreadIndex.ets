import router from '@ohos.router';
import { StandardButton } from '../../view/StandardButton'

@Entry
@Component
struct ThreadIndex {
  build() {
    Column() {
      StandardButton({name: '启动Worker'})
        .onClick(() => {
          router.pushUrl({url: "pages/thread/WorkIndex"})
        })
      StandardButton({name: '启动TaskPool'})
        .onClick(() => {
          router.pushUrl({url: "pages/thread/TaskPoolIndex"})
        })
    }.width('100%')
    .padding({top: 30})
  }
}