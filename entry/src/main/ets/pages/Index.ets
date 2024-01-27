import router from '@ohos.router';
import { StandardButton } from '../view/StandardButton';

@Entry
@Component
struct Index {

  build() {
    Column() {
      StandardButton({name: '瀑布流-懒加载-性能优化'})
        .onClick(() => {
          router.pushUrl({url: "pages/list/ListIndex"})
        })
    }.width('100%')
    .height('100%')
    .margin({top: 30})
  }
}