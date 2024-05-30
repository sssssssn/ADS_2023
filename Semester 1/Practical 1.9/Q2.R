#Q2 Rewrite the code
library(ggplot2)

ggplot(data = diamonds, aes(x = carat, y = price, group = cut)) +
  
  geom_point(stat = "identity", aes(colour = cut), size = 0.5, alpha = 0.3) + #stat = "identity"参数指定要应用于数据的统计转换。当stat设置为“identity”时，数据集中的每一行都直接对应于散点图上的一个点
  facet_wrap(~cut, ncol = 2) + #创建一个分面图，其中数据根据“cut”变量的级别划分为子集，每个子集分别绘制
  scale_color_hue(l = 30, c = 70) + #l:颜色明度 c:颜色色度
  scale_y_continuous(limits = c(0, 20000)) + #y轴极限
  geom_smooth(method = "lm") + #用"lm"(线性模型)方法在绘图中添加一条线性回归线
  labs(title = "Price vs carat in diamonds") + 
  theme_bw() + #这将一个简单的黑白主题应用到情节中
  #theme() + #这是附加主题修改的占位符，可以在这里进一步自定义情节的外观
  guides(color = #指定应该修改颜色的图例
  guide_legend(override.aes = list()))
  



