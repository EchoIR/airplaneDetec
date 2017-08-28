clc;  clear all;
fid=fopen('train.txt', 'w'); 
jpgPatrh = importdata('/home/echo/EXERCISEs/airplaneDetec/yolov3/infrared_train.txt' );
for j = 1:size(jpgPatrh,1)
    jpgPatrh{j} = [jpgPatrh{j} ' /home/echo/EXERCISEs/airplaneDetec/Annotations/' jpgPatrh{j}(end-7:end-4) '.xml'];
    fprintf(fid,'%s\n', jpgPatrh{j}); 
end
fclose(fid);

clc;  clear all;
fid=fopen('test.txt', 'w'); 
jpgPatrh = importdata('/home/echo/EXERCISEs/airplaneDetec/yolov3/infrared_test.txt' );
for j = 1:size(jpgPatrh,1)
    jpgPatrh{j} = [jpgPatrh{j} ' /home/echo/EXERCISEs/airplaneDetec/Annotations/' jpgPatrh{j}(end-7:end-4) '.xml'];
    fprintf(fid,'%s\n', jpgPatrh{j}); 
end
fclose(fid);
