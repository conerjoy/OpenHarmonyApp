import taskpool from '@ohos.taskpool';

@Entry
@Component
struct TaskPoolIndex {
  private backgroundTask: taskpool.Task = new taskpool.Task(this.doInBackground, "background params")

  build() {
    Column({ space: 10 }) {
      Button("创建Task")
        .onClick(() => {
          this.createTask();
        })

      Button("执行Task")
        .onClick(() => {
          this.executeTask();
        })

      Button("取消Task")
        .onClick(() => {
          this.cancelTask();
        })
    }
    .width("100%")
    .height("100%")
    .padding(10)
  }

  // 该方法在子线程中执行
  private doInBackground(params: string) {
    console.log("doInBackground: " + params);
  }

  private createTask() {
    this.backgroundTask = new taskpool.Task(this.doInBackground, "background params");
  }

  private executeTask() {
    if (this.backgroundTask) {
      taskpool.execute(this.backgroundTask);
    }
  }

  private cancelTask() {
    if (this.backgroundTask) {
      taskpool.cancel(this.backgroundTask);
    }
  }
}