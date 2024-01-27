export default class DataBean {
  title: string = ''
  content: string = ''
  time: string = ''
  imgUrl: string = ''

  init(): DataBean {
    this.title = '这是一个标题'
    this.content = '说点什么呢'
    this.time = '2024/01/27 12:20'
    this.imgUrl = "https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF"
    return this
  }
}