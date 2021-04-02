library(caret)
library(e1071)
rm(list = ls())
#membaca data
main_data = read.csv("data_3_class_seimbang.csv", stringsAsFactors = FALSE)
#membagi data: training & testing - start
print("Pembagian data")
train_index = createDataPartition(main_data$class_label, p=0.8, list = FALSE)
main_data.training = main_data[train_index, ]
main_data.testing = main_data[-train_index, ]
#membuat class_label menjadi kategori
main_data.training$class_label = as.factor(main_data.training$class_label)
main_data.testing$class_label = as.factor(main_data.testing$class_label)
#membagi data: training & testing - end
#membuat model klasifikasi
print("Training model klasifikasi")
model_klasifikasi = svm(class_label ~ ., main_data.training)
#melakukan prediksi
print("Melakukan predisi")
prediksi_klasifikasi = predict(model_klasifikasi, main_data.testing[,-5])
#menghitung kinerja klasifikasi
print("Menghitung kinerja klasifikasi")
kinerja_klasifikasi = confusionMatrix(prediksi_klasifikasi,
                                      main_data.testing$class_label, positive = "positive")
print(kinerja_klasifikasi)