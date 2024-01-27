import DataBean from '../../../../../.preview/cache/.default/entry/src/main/ets/pages/list/DataBean'
import { CustomItem } from './CustomItem'
import { DataSource } from './DataSource'

@Entry
@Component
struct ListIndex {
  data: DataSource = new DataSource()

  build() {
    List() {
      LazyForEach(this.data, (item: DataBean) => {
        ListItem() {
          CustomItem({title: item.title, content: item.content, time: item.time, imgUrl: item.imgUrl})
        }
      }, (item: string) => item)
    }
    .cachedCount(5) // 缓存item数量
    .reuseId('CustomItem')
  }
}