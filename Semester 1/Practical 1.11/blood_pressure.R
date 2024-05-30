bp_t_test<-t.test(bpdata$bp_before, bpdata$bp_after, paired = TRUE)
print(bp_t_test)

