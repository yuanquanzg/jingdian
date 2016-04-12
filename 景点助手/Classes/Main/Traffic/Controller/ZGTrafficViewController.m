//
//  ZGMapViewController.m
//  景点助手
//
//  Created by ZZG on 16/4/12.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGTrafficViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import "ZGTrafficOptionButton.h"

@interface ZGTrafficViewController ()<BMKMapViewDelegate, BMKGeoCodeSearchDelegate>

@property (strong, nonatomic) BMKMapView* mapView;
@property (strong, nonatomic) BMKGeoCodeSearch *searcher;
@property (strong, nonatomic) UIView *optionView;

@end

#define KOptionButtonWidth 30.f
#define KOptionButtonHeight 50.f


@implementation ZGTrafficViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"景点地图";
    
    [self buildView];
    
    [self initData];
    
    
}

- (void)buildView {
    
    _mapView = [[BMKMapView alloc]initWithFrame:self.view.frame];
    //    [_mapView setZoomLevel:15];
    self.view = _mapView;
    
    
    ZGTrafficOptionButton *trafficButton = [ZGTrafficOptionButton buttonWithType:UIButtonTypeCustom];
    [trafficButton setFrame:CGRectMake(0, 0, KOptionButtonWidth, KOptionButtonHeight)];
    [trafficButton addTarget:self action:@selector(trafficButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [trafficButton setImage:[UIImage imageNamed:@"traffic_trafficButton_deselect"] forState:UIControlStateNormal];
    [trafficButton setTitle:@"交通" forState:UIControlStateNormal];
    [trafficButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [trafficButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [trafficButton setBackgroundColor:[UIColor whiteColor]];
    
    
    ZGTrafficOptionButton *mapButton = [ZGTrafficOptionButton buttonWithType:UIButtonTypeCustom];
    [mapButton setFrame:CGRectMake(0, KOptionButtonHeight, KOptionButtonWidth, KOptionButtonHeight)];
    [mapButton addTarget:self action:@selector(mapButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [mapButton setImage:[UIImage imageNamed:@"traffic_mapButton_deselect"] forState:UIControlStateNormal];
    [mapButton setTitle:@"类型" forState:UIControlStateNormal];
    [mapButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [mapButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [mapButton setBackgroundColor:[UIColor whiteColor]];
    
    
    _optionView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - KOptionButtonWidth, 100, KOptionButtonWidth, KOptionButtonHeight * 2)];
//    [_optionView setBackgroundColor:[UIColor whiteColor]];
    [_optionView addSubview:trafficButton];
    [_optionView addSubview:mapButton];
    
    [self.view addSubview:_optionView];
    
}

- (void)initData {
    
    _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    geoCodeSearchOption.city= [defaults objectForKey:@"cityName"];
    geoCodeSearchOption.address = _scenicName;
    BOOL flag = [_searcher geoCode:geoCodeSearchOption];
    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }

}


- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
//    if (error == BMK_SEARCH_NO_ERROR) {
//        //在此处理正常结果
//    }
//    else {
//        NSLog(@"抱歉，未找到结果");
//    }
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:_mapView.overlays];
    [_mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
//        NSString* titleStr;
//        NSString* showmeg;
        
//        titleStr = @"正向地理编码";
//        showmeg = [NSString stringWithFormat:@"经度:%f,纬度:%f",item.coordinate.latitude,item.coordinate.longitude];
//        
//        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
//        [myAlertView show];
    }

}

//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
//        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
//        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
//        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
//        return newAnnotationView;
//    }
//    return nil;
//}


- (void)trafficButtonClick:(UIButton *)sender {
    
    if (!sender.selected) {
        [sender setSelected:YES];
        [sender setImage:[UIImage imageNamed:@"traffic_trafficButton_select"] forState:UIControlStateNormal];
        //打开实时路况图层
        [_mapView setTrafficEnabled:YES];
    }else {
        [sender setSelected:NO];
        [sender setImage:[UIImage imageNamed:@"traffic_trafficButton_deselect"] forState:UIControlStateNormal];
        //关闭实时路况图层
        [_mapView setTrafficEnabled:NO];
    }
    
}

- (void)mapButtonClick:(UIButton *)sender {
    
    if (!sender.selected) {
        [sender setSelected:YES];
        [sender setImage:[UIImage imageNamed:@"traffic_mapButton_select"] forState:UIControlStateNormal];
        //切换为卫星图
        [_mapView setMapType:BMKMapTypeSatellite];
    }else {
        [sender setSelected:NO];
        [sender setImage:[UIImage imageNamed:@"traffic_mapButton_deselect"] forState:UIControlStateNormal];
        //切换为普通地图
        [_mapView setMapType:BMKMapTypeStandard];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    
    _searcher.delegate = nil;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
