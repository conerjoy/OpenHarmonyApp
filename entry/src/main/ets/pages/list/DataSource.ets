import DataBean from './DataBean';

export class DataSource implements IDataSource {
  private data: Array<DataBean> = []
  private listeners: DataChangeListener[] = []

  constructor() {
    for (let i = 0; i < 10000; i++) {
      this.data.push(new DataBean().init())
    }
  }
  
  totalCount(): number {
    return this.data.length;
  }

  getData(index: number) {
    return this.data[index]
  }

  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }
}