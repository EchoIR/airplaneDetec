clc;clear all
%训练样本大小
train_size = load('trainval_name_size.txt');
%高
min(train_size(:,2))%51
mean(train_size(:,2))% 267.0920
max(train_size(:,2))% 1024

min(train_size(:,3))%57
mean(train_size(:,3))% 307
max(train_size(:,3))% 1252


%测试样本大小
test_size = load('test_name_size.txt');
%高
min(test_size(:,2))%91
mean(test_size(:,2))%435.6923
max(test_size(:,2))% 2304

min(test_size(:,3))%126
mean(test_size(:,3))%541
max(test_size(:,3))% 3072


%%%%%%%%%%%%%框的大小％％％％％％％％％％％％
clc;clear all;
%训练样本框大小
train_size = load('trainval_label.txt');
%高
min(train_size(:,5))%8
mean(train_size(:,5))% 53
max(train_size(:,5))% 196

min(train_size(:,6))%7
mean(train_size(:,6))% 44
max(train_size(:,6))% 196


%测试样本框大小
test_size = load('test_label.txt');
%高
min(test_size(:,5))%13
mean(test_size(:,5))%52
max(test_size(:,5))% 261,255,254,215

min(test_size(:,6))%9
mean(test_size(:,6))%44
max(test_size(:,6))% 268,266,265,161