import router from '@ohos.router';
import { StandardButton } from '../view/StandardButton';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index {

  build() {
    Column() {
      StandardButton({name: '瀑布流-懒加载-性能优化'})
        .onClick(() => {
          router.pushUrl({url: "pages/list/ListIndex"})
        })
      StandardButton({name: '跳转到别的Ability'})
        .onClick(() => {
          postCardAction(this, {
            'action': 'router',
            'abilityName': 'BusAbility', // 只能跳转到当前应用下的UIAbility
            'params': {
              'targetPage': 'funB' // 在EntryAbility中处理这个信息
            }
          })
          let context = getContext(this) as common.UIAbilityContext
          context.startAbility({
            deviceId: '',
            bundleName: 'com.coner.openharmonyapp',
            abilityName: 'BusAbility'
          })
        })
      StandardButton({name: '线程演示'})
        .onClick(() => {
          router.pushUrl({url: "pages/thread/ThreadIndex"})
        })
      StandardButton({name: '音频'})
        .onClick(() => {
          router.pushUrl({url: "pages/audio/AudioIndex"})
        })
    }.width('100%')
    .height('100%')
    .margin({top: 30})
  }
}