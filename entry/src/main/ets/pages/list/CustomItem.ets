import DataBean from './DataBean'

@Preview
@Component
@Reusable
export struct CustomItem {
  title: string = ''
  content: string = ''
  time: string = ""
  imgUrl: string = ''

  aboutToReuse(params: Object) {
    if (params instanceof DataBean) {
      this.title = params.title
      this.content = params.content
      this.time = params.time
      this.imgUrl = params.imgUrl
    }
  }

  build() {
    Row() {
      Column() {
          Text(this.title)
            .width(100)
            .fontSize(22)
            .textAlign(TextAlign.Start)
            .alignSelf(ItemAlign.Start)

        Row() {
          Text(this.content)
            .width(100)
            .fontSize(18)

          Text(this.time)
            .width(100)
            .fontColor(Color.Gray)
            .fontSize(10)
        }.margin({top: 18})
      }.padding({left: 12})
      .justifyContent(FlexAlign.SpaceBetween)

      Image(this.imgUrl)// 直接加载网络地址，请填写一个具体的网络图片地址
          .alt($r('app.media.icon'))// 使用alt，在网络图片加载成功前使用占位图
          .width(100)
          .height(100)
    }
  }
}