//
//  ViewController.m
//  现实动画
//
//  Created by qianfeng on 16/1/7.
//  Copyright © 2016年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    //现实动画
    UIDynamicAnimator *_dyAn;
    //现实行为
    UIDynamicItemBehavior *_dyItem;
    //重力行为
    UIGravityBehavior *_graBh;
    //碰撞行为
    UICollisionBehavior *_collision;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createDynamic];
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(30, 0, 100, 100)];
    view1.backgroundColor=[UIColor redColor];
    [self.view addSubview:view1];
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
    view2.layer.cornerRadius=50;
    view2.layer.masksToBounds=YES;
    view2.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:view2];
    //iOS后必须是下面这样
    _dyAn=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    _dyItem=[[UIDynamicItemBehavior alloc]initWithItems:@[view1,view2]];
    _dyItem.elasticity=0.6;
    _graBh=[[UIGravityBehavior alloc]initWithItems:@[view1,view2]];
    _collision=[[UICollisionBehavior alloc]initWithItems:@[view1,view2]];
    _collision.translatesReferenceBoundsIntoBoundary=YES;
    
    //将行为添加到现实动画中
    [_dyAn addBehavior:_dyItem];
    [_dyAn addBehavior:_graBh];
    [_dyAn addBehavior:_collision];

    
}
-(void)createDynamic{
    //创建显示行为
    _dyAn=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    //创建显示行为
    _dyItem=[[UIDynamicItemBehavior alloc]initWithItems:nil];
    //设置弹力值，数值越大，弹得越高
    _dyItem.elasticity=0.6;
    //创建重力行为
    _graBh=[[UIGravityBehavior alloc]initWithItems:nil];
    //重力的方向
//    _graBh.gravityDirection=CGVectorMake(0, -100);
    //创建碰撞行为
    _collision=[[UICollisionBehavior alloc]initWithItems:nil];
    //开启刚体碰撞
    _collision.translatesReferenceBoundsIntoBoundary=YES;
    //将行为添加到现实动画中
    [_dyAn addBehavior:_dyItem];
    [_dyAn addBehavior:_graBh];
    [_dyAn addBehavior:_collision];
    
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(down) userInfo:nil repeats:YES];
    [timer setFireDate:[NSDate distantPast]];
    
}
-(void)down{
    //x坐标
    int x=arc4random()%(int)self.view.frame.size.width;
    //
    int size=arc4random()%50+1;
    NSArray *imageArr=@[@"bird1",@"bluebird1",@"pig1",@"pig_44",@"shelf1",@"yellowbird1"];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x, 100, size, size)];
    imageView.image=[UIImage imageNamed:imageArr[arc4random()%imageArr.count]];
    [self.view addSubview:imageView];
    //让imageView遵循行为
    [_dyItem addItem:imageView];
    [_graBh addItem:imageView];
    [_collision addItem:imageView];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //x坐标
    int x=arc4random()%(int)self.view.frame.size.width;
    //
    int size=arc4random()%50+1;
    NSArray *imageArr=@[@"bird1",@"bluebird1",@"pig1",@"pig_44",@"shelf1",@"yellowbird1"];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x, 100, size, size)];
    imageView.image=[UIImage imageNamed:imageArr[arc4random()%imageArr.count]];
    [self.view addSubview:imageView];
    //让imageView遵循行为
    [_dyItem addItem:imageView];
    [_graBh addItem:imageView];
    [_collision addItem:imageView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
