@Component
export struct StandardButton {
  @Prop name: string

  build() {
    Button(this.name)
      .width('50%')
      .height(44)
      .margin({bottom: 14})
  }
}