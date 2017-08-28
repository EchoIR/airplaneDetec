clc;clear all
train_size = load('train_name_size.txt');%无误
DST_PATH_image = '/home/echo/EXERCISEs/airplaneDetec/yolov3/JPEGImages/';
DST_PATH_label = '/home/echo/EXERCISEs/airplaneDetec/yolov3/labels/';
%处理长款都不足以352的训练样本，即直接使用原来的训练样本与相应的label文件
index352 = (train_size(:,2)<=352).*(train_size(:,3)<=352);
count = 1;
for i = 1:length(index352)
    if index352(i)
        imagePath = ['/home/echo/EXERCISEs/airplaneDetec/JPEGImages/' num2str(train_size(i,1)) '.jpg'];
        labelPath = ['/home/echo/EXERCISEs/airplaneDetec/labels/' num2str(train_size(i,1)) '.txt'];
        image = imread(imagePath);
        newName = num2str(10000 + count);
        copyfile(imagePath,[DST_PATH_image newName(2:end) '.jpg']);
        copyfile(labelPath,[DST_PATH_label  newName(2:end) '.txt']);
        count = count + 1;
    end
end
%以上代码是对的

%以下处理大于352的训练样本
clc;clear all
fix_x = 352;
fix_y = 352;
%训练样本大小
train_size = load('train_name_size.txt');
DST_PATH_image = '/home/echo/EXERCISEs/airplaneDetec/yolov3/JPEGImages/352/';
DST_PATH_label = '/home/echo/EXERCISEs/airplaneDetec/yolov3/labels/352/';
index352 = (train_size(:,2)<=352).*(train_size(:,3)<=352);
index_no352 = ones(1000,1)-index352;
count = sum(index352)+1;
for i = 1:length(index_no352)
    i
    if index_no352(i)
        imagePath = ['/home/echo/EXERCISEs/airplaneDetec/JPEGImages/' num2str(train_size(i,1)) '.jpg'];
        labelPath = ['/home/echo/EXERCISEs/airplaneDetec/yolov3/labels_orig/' num2str(train_size(i,1)) '.txt'];
        label_image = load(labelPath);
        mean_xy = floor(mean(label_image(:,2:3),1));
        center_xy = mean_xy;
        %注意：train_size中2是y,3是x
        image = imread(imagePath);
        image_size = train_size(i,2:3);%y,x
        [min_x, max_x, min_y, max_y] = getPatch(center_xy,image_size,fix_x,fix_y);
        image_patch = image(min_y:max_y,min_x:max_x,:);
        %imshow(image_patch);
        newName = num2str(10000 + count);
        %保存图片
        imwrite(image_patch,[DST_PATH_image newName(2:end) '.jpg']);
        %以上都是对的
        %保存label
        clip_labels = getLabel(fix_x,fix_y,min_x, max_x, min_y, max_y,label_image,image_size);
        f_id=fopen([DST_PATH_label newName(2:end) '.txt'],'wt');
        for j = 1:size(clip_labels,1)
            fprintf(f_id,'%d ',clip_labels(j,:));%输出 可以整行输出 并统一控制格式
            fprintf(f_id,'\n');%换行
        end
        fclose(f_id);
        count = count + 1;
        
        %再以四个顶点为中心点
        center_vertex = [min_x,min_y;min_x,max_y;max_x,min_y;max_x,max_y];
        for k = 1:size(center_vertex,1)
            [min_x, max_x, min_y, max_y] = getPatch(center_vertex(k,:),image_size,fix_x,fix_y);
            image_patch = image(min_y:max_y,min_x:max_x,:);
            %imshow(image_patch);
            newName = num2str(10000 + count);
            %保存图片
            imwrite(image_patch,[DST_PATH_image newName(2:end) '.jpg']);
            %保存label
            clip_labels = getLabel(fix_x,fix_y,min_x, max_x, min_y, max_y,label_image,image_size);
            f_id=fopen([DST_PATH_label newName(2:end) '.txt'],'wt');
            for j = 1:size(clip_labels,1)
                fprintf(f_id,'%d ',clip_labels(j,:));%输出 可以整行输出 并统一控制格式
                fprintf(f_id,'\n');%换行
            end
            fclose(f_id);
            count = count + 1;
        end   
    end
end
%%经验证，以上代码都是对的,并且最后1.jpg－1852.jpg都是训练样本。
