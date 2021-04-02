rm(list = ls())
#membaca data
main_data = read.csv("data_3_class_seimbang.csv", stringsAsFactors = FALSE)
#membagi data: training & testing - start
print("Pembagian data")
main_data.positive = main_data[which(main_data$class_label == "positive"),]
main_data.negative = main_data[which(main_data$class_label == "negative"),]
main_data.neutral = main_data[which(main_data$class_label == "neutral"),]
main_data.training = rbind(main_data.positive[1:40,],
                           main_data.negative[1:40,], main_data.neutral[1:40,])
main_data.testing = rbind(main_data.positive[41:50,],
                          main_data.negative[41:50,], main_data.neutral[41:50,])
#membuat class_label menjadi kategori
main_data.training$class_label = as.factor(main_data.training$class_label)
main_data.testing$class_label = as.factor(main_data.testing$class_label)
#membagi data: training & testing - end
#membuat model klasifikasi
print("Training model klasifikasi")
#melakukan prediksi
print("Melakukan prediksi")
#menghitung kinerja klasifikasi
print("Menghitung kinerja klasifikasi")

