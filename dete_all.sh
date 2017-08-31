#!#!/bin/bash
root_dir="/home/echo/darknet-master"
cd $root_dir

for index in $(seq 1 807)
do
#echo $((index+1852))
./darknet detector test /home/echo/EXERCISEs/airplaneDetec/yolov3/voc.data /home/echo/EXERCISEs/airplaneDetec/yolov3/yolo-voc.cfg /home/echo/EXERCISEs/airplaneDetec/yolov3/backup/yolo-voc_final.weights -out /home/echo/EXERCISEs/airplaneDetec/yolov3/YOLOv3_results/$((index+1852)) /home/echo/EXERCISEs/airplaneDetec/yolov3/JPEGImages/$((index+1852)).jpg
done

