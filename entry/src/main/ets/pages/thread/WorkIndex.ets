import worker from '@ohos.worker';

let TAG = "WORKER_MAIN_THREAD";
let URL = "entry/ets/worker/worker.ts";

@Entry
@Component
struct WorkIndex {
  @State message: string = 'Hello World';
  private workerInstance: worker.ThreadWorker = new worker.ThreadWorker(URL, {
    name: "WORKER_THREAD"
  })

  private initWorker() {
    this.workerInstance = new worker.ThreadWorker(URL, {
      name: "WORKER_THREAD"
    })
  }

  private monitorMessage() {
    this.workerInstance.onmessage = (data) => {
      console.log(`${TAG}, workerInstance.onMessage: ` + JSON.stringify(data));
    }
  }

  private sendMessage() {
    this.workerInstance.postMessage("Hello, Worker, I'm main thread");
  }

  private destroyWorker() {
    this.workerInstance.terminate();
  }

  build() {
    Column({ space: 8 }) {
      Button("初始化Worker")
        .height(60)
        .fontSize(20)
        .onClick(() => {
          this.initWorker();
        })

      Button("监听Worker的消息")
        .height(60)
        .fontSize(20)
        .onClick(() => {
          this.monitorMessage();
        })

      Button("给Worker发消息")
        .height(60)
        .fontSize(20)
        .onClick(() => {
          this.sendMessage();
        })

      Button("销毁 Worker")
        .height(60)
        .fontSize(20)
        .onClick(() => {
          this.destroyWorker();
        })

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}