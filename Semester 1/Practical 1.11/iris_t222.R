data<-data("iris")
setosa<-iris$Sepal.Length[iris$Species == "setosa"]
versicolor<-iris$Sepal.Length[iris$Species == "versicolor"]
t_result<-t.test(setosa, versicolor, var.equal = FALSE)
print(t_result)

