#include "locations.h"
void get_patchLocations(image im,int **location,int step, int wn, int hn){
    int wn_i;
    int hn_i,loca_index;
    if(im.h<=352&&im.w<=352){
        printf("im.h<=352&&im.w<=352:%d,%d,%d\n",im.h,im.w,im.c);
	//wn = 1;
        //hn = 1;
/*
	location =(int **)calloc(wn*hn, sizeof(int *));//堆起来的二维数组
        for(j = 0;j<wn*hn;j++){
            location[j] = calloc(4, sizeof(int));
        }
*/
	//sizeds = (image **)calloc(hn, sizeof(image *));
	//sized = letterbox_image(im, net.w, net.h);//二维数组
        //sizeds[0] = calloc(wn, sizeof(image *));
	//sizeds[0][0] = sized;
        //printf("test here1\n");
        location[0][0] = 0;
        //printf("test here2\n");
	location[0][1] = im.w-1;
	location[0][2] = 0;
	location[0][3] = im.h-1;
        //printf("test here3\n");
	//以上没有问题
    }else if(im.h<=352){
        printf("im.h<=352:%d,%d,%d\n",im.h,im.w,im.c);
        //wn = ceil(((float)im.w-352)/step)+1;
	//hn = 1;
        //printf("%d\n",wn);
/*
	sizeds = (image **)calloc(hn, sizeof(image *));
        for(j = 0;j<hn;j++){
            sizeds[j] = calloc(wn, sizeof(image *));
        }
*/
/*
	location =(int **)calloc(wn*hn, sizeof(int *));//堆起来的二维数组
        for(j = 0;j<wn*hn;j++){
            location[j] = calloc(4, sizeof(int));
        }
*/
        printf("wangsujuan\n");
	for(wn_i = 0;wn_i<wn-1;++wn_i ){
	    //im_patch = crop_image(im, wn_i*step, 0, 352, im.h);
            //printf("wangsujuan2\n");
	    //sized = letterbox_image(im_patch, net.w, net.h);
            //sizeds[0][wn_i] = sized;
            //printf("wangsujuan1\n");
            //printf("%d\n",wn_i);
            location[wn_i][0] = wn_i*step;//就是这一步出现问题了
            printf("%d\n",wn_i);
            location[wn_i][1] = wn_i*step+351;
            location[wn_i][2] = 0;
            location[wn_i][3] = im.h-1;
            printf("wangsujuan3\n");
	}
	//im_patch = crop_image(im, im.w-352, 0, 352, im.h);
	//sized = letterbox_image(im_patch, net.w, net.h);
        //sizeds[0][wn-1] = sized;
        location[wn-1][0] = im.w-352;
        location[wn-1][1] = im.w-1;
        location[wn-1][2] = 0;
        location[wn-1][3] = im.h-1;
	//以上无误       
    }else if(im.w<=352){
        printf("im.w<=352:%d,%d,%d\n",im.h,im.w,im.c);
	//wn = 1;
	//hn = ceil(((float)im.h-352)/step)+1;
/*
	sizeds = (image **)calloc(hn, sizeof(image *));
        for(j = 0;j<hn;j++){
            sizeds[j] = calloc(wn, sizeof(image *));
        }
*/
/*
	location =(int **)calloc(wn*hn, sizeof(int *));//堆起来的二维数组
        for(j = 0;j<wn*hn;j++){
            location[j] = calloc(4, sizeof(int));
        }
*/
	for(hn_i = 0;hn_i<hn-1;++hn_i ){
	    //im_patch = crop_image(im, 0, hn_i*step, im.w, 352);
	    //sized = letterbox_image(im_patch, net.w, net.h);
            //sizeds[hn_i][0] = sized;
            location[hn_i][0] = 0;
            location[hn_i][1] = im.w-1;
            location[hn_i][2] = hn_i*step;
            location[hn_i][3] = hn_i*step+351;
	 }
	 //im_patch = crop_image(im, 0, im.h-352, im.w, 352);
	 //sized = letterbox_image(im_patch, net.w, net.h);
         //sizeds[hn-1][0] = sized;
         location[hn-1][0] = 0;
         location[hn-1][1] = im.w-1;
         location[hn-1][2] = im.h-352;
         location[hn-1][3] = im.h-1;
        //以上无误
    }else{
         printf("im.h>352&&im.w>352:%d,%d,%d\n",im.h,im.w,im.c);
	 //wn = ceil(((float)im.w-352)/step)+1;
 	 //hn = ceil(((float)im.h-352)/step)+1;
/*
	 sizeds = (image **)calloc(hn, sizeof(image *));
         for(j = 0;j<hn;j++){
             sizeds[j] = calloc(wn, sizeof(image *));
         }
*/
/*
	location =(int **)calloc(wn*hn, sizeof(int *));//堆起来的二维数组
        for(j = 0;j<wn*hn;j++){
            location[j] = calloc(4, sizeof(int));
        }
*/
	 for(hn_i = 0;hn_i<hn-1;++hn_i ){
	     for(wn_i = 0;wn_i<wn-1;++wn_i){
	         //im_patch = crop_image(im, wn_i*step, hn_i*step, 352, 352);
	         //sized = letterbox_image(im_patch, net.w, net.h);
                 //sizeds[hn_i][wn_i] = sized;
                 loca_index = (hn_i*wn)+wn_i;
                 location[loca_index][0] = wn_i*step;
                 location[loca_index][1] = wn_i*step+351;
                 location[loca_index][2] = hn_i*step;
                 location[loca_index][3] = hn_i*step+351;
		 //printf("test here10\n");          
	     }  
	     //im_patch = crop_image(im, im.w-352, hn_i*step, 352, 352);
	     //sized = letterbox_image(im_patch, net.w, net.h);
             //sizeds[hn_i][wn-1] = sized;
             loca_index = (hn_i+1)*wn-1;
	     location[loca_index][0] = im.w-352;
	     location[loca_index][1] = im.w-1;
	     location[loca_index][2] = hn_i*step;
	     location[loca_index][3] = hn_i*step+351;
	     //printf("test here11\n");
         } 
	 for(wn_i = 0;wn_i<wn-1;++wn_i ){
	     //im_patch = crop_image(im, wn_i*step, im.h-352, 352, 352);
	     //sized = letterbox_image(im_patch, net.w, net.h);
             //sizeds[hn-1][wn_i] = sized;
             loca_index = (hn-1)*wn+wn_i;
             location[loca_index][0] = wn_i*step;
             location[loca_index][1] = wn_i*step+351;
             location[loca_index][2] = im.h-352;
             location[loca_index][3] = im.h-1;
             //printf("test here12\n");
         }  
	 //im_patch = crop_image(im, im.w-352, im.h-352, 352, 352);
	 //sized = letterbox_image(im_patch, net.w, net.h);
         //sizeds[hn-1][wn-1] = sized;
         loca_index = hn*wn-1;
	 location[loca_index][0] = im.w-352;
	 location[loca_index][1] = im.w-1;
	 location[loca_index][2] = im.h-352;
	 location[loca_index][3] = im.h-1;
	 //printf("test here6\n");
    }
}
