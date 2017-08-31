clc;clear all;
for j = 941:2659
    index = num2str(10000+j);
    boxes = load(['/home/echo/EXERCISEs/airplaneDetec/yolov3/labels/' index(2:5) '.txt']);
    im = imread(['/home/echo/EXERCISEs/airplaneDetec/yolov3/JPEGImages/' index(2:5) '.jpg']);
    im_w = size(im,2);
    im_h = size(im,1);
    if size(boxes,1)>=1
        boxes(:,2) = boxes(:,2)*im_w;
        boxes(:,3) = boxes(:,3)*im_h;
        boxes(:,4) = boxes(:,4)*im_w;
        boxes(:,5) = boxes(:,5)*im_h;
        max_x = ceil((2*boxes(:,2)+ boxes(:,4))/2)-2;
        min_x = ceil(2*boxes(:,2)-max_x)+1;
        max_y = ceil((2*boxes(:,3)+ boxes(:,5))/2)-2;
        min_y = ceil(2*boxes(:,3)-max_y)+1;
        for i = 1:length(max_x)
            im(min_y(i):max_y(i),min_x(i):max_x(i),1) =  im(min_y(i):max_y(i),min_x(i):max_x(i),1) + 200;
        end
        %imshow(im);
        imwrite(im,['/home/echo/EXERCISEs/airplaneDetec/yolov3/modify_labels/images/' index(2:5) '.jpg']);
    end
end
