//
//  NFXIntroViewController.m
//  NFXTourViewControllerDEMO
//
//  Created by Tomoya_Hirano on 2014/10/04.
//  Copyright (c) 2014年 Tomoya_Hirano. All rights reserved.
//

#import "NFXIntroViewController.h"

#define nextText @"next"
#define startText @"start"

@interface NFXIntroViewController() <UIScrollViewDelegate>{
    UIScrollView*_scrollview;
    UIButton*_button;
    UIButton*_buttonlogin;
    UIPageControl*_pgcontrol;
    NSArray*_images;
    UIImageView*_backgroundimageview;
}

@end

@implementation NFXIntroViewController

-(id)initWithViews:(NSArray*)images{
    self = [super init];
    if (self) {
        //check views length
        NSAssert(images.count!=0, @".views's length is zero.");
        
        /**
         *  setup viewcontroller
         */
         //self.view.backgroundColor = [UIColor colorWithWhite:3.0 alpha:.4];
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        _images = images;
        
        /**
         *  background Image
         */
        UIImageView *bgHolder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        UIImage *bgImage = [UIImage imageNamed:@"bg-1"];
        bgHolder.image = bgImage;
        // optional:
        // [imageHolder sizeToFit];
        [self.view addSubview:bgHolder];
        
        /**
         *  logo image
         */
        UIImage *_logoImage = [UIImage imageNamed:@"logo-1"];
        UIImageView *_logoHolder = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - _logoImage.size.width/2, 70, _logoImage.size.width, _logoImage.size.width)];
        _logoHolder.image = _logoImage;
        // optional:
        [_logoHolder sizeToFit];
        [self.view addSubview:_logoHolder];
        
        /**
         *  positions
         */
        CGRect svrect_ = CGRectZero;
        svrect_.size.height = self.view.bounds.size.width/1.6;
        svrect_.size.width = self.view.bounds.size.width;
        CGPoint svcenter_ = CGPointZero;
        svcenter_.x = self.view.center.x;
        svcenter_.y = _logoHolder.center.y + _logoImage.size.height + 25;
        CGSize svconsize = CGSizeZero;
        svconsize.height = svrect_.size.height;
        svconsize.width = svrect_.size.width * images.count;
        
        CGPoint pgconcenter_ = CGPointZero;
        pgconcenter_.x = self.view.center.x;
        pgconcenter_.y = svcenter_.y + (svrect_.size.height/2) + 20;
        
        CGRect btnrect_ = CGRectZero;
        btnrect_.size.width = 250;
        btnrect_.size.height = 50;
        CGPoint btncenter_ = CGPointZero;
        btncenter_.x = self.view.center.x;
        btncenter_.y = self.view.bounds.size.height-65;
        
        UIImage* fill = createImageFromUIColor([UIColor colorWithWhite:0.9 alpha:1]);
        
        
        /*
         Views
         */
        _backgroundimageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_backgroundimageview];
        
        _scrollview = [[UIScrollView alloc] initWithFrame:svrect_];
        _scrollview.center = svcenter_;
        _scrollview.contentSize = svconsize;
        _scrollview.pagingEnabled = true;
        _scrollview.bounces = false;
        _scrollview.delegate = self;
        _scrollview.showsHorizontalScrollIndicator = false;
    
        [self.view addSubview:_scrollview];
        
        
        
        _pgcontrol = [[UIPageControl alloc] initWithFrame:CGRectZero];
        _pgcontrol.pageIndicatorTintColor = [UIColor whiteColor];
        _pgcontrol.currentPageIndicatorTintColor = [UIColor colorWithRed:46.0/255.0f green:255.0/255.0f  blue:161.0/255.0f  alpha:1.0];
        _pgcontrol.numberOfPages = _images.count;
        _pgcontrol.currentPage = 0;
        [_pgcontrol sizeToFit];
        _pgcontrol.center = pgconcenter_;
        [self.view addSubview:_pgcontrol];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(ButtonPushed:) forControlEvents:UIControlEventTouchDown];
        [_button setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
        [_button setTitle:nextText forState:UIControlStateNormal];
        [_button setBackgroundImage:fill forState:UIControlStateHighlighted];
        _button.clipsToBounds = true;
        _button.frame = btnrect_;
        _button.center = btncenter_;
        _button.layer.cornerRadius = 4;
        _button.layer.borderWidth = 0.5f;
        _button.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
        
        //[self.view addSubview:_button];
        
//        _buttonlogin = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_buttonlogin setImage:[UIImage imageNamed:@"image.png"] forState:forState:UIControlStateNormal addTarget:self action:@selector(ButtonPushed:) forControlEvents:UIControlEventTouchDown];

        //[_buttonlogin setBackgroundImage:fill forState:UIControlStateHighlighted];
        _buttonlogin.clipsToBounds = true;
        _buttonlogin.frame = btnrect_;
        _buttonlogin.center = btncenter_;
        _buttonlogin.layer.cornerRadius = 4;
        _buttonlogin.layer.borderWidth = 0.5f;
        _buttonlogin.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
        
        [self.view addSubview:_buttonlogin];
        
//        NSDictionary *elemDisct = NSDictionaryOfVariableBindings(_scrollview, _logoHolder);
//        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_scrollview(<=100)]-[_logoHolder]-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:elemDisct]];
       
        
        int index_ = 0;
        for (UIImage*image_ in images) {
            NSAssert([image_ isKindOfClass:[UIImage class]],@".views are not only UIImage.");
            CGRect ivrect_ = CGRectMake(_scrollview.bounds.size.width * index_,
                                        0,
                                        _scrollview.bounds.size.width,
                                        _scrollview.bounds.size.height);
            UIImageView*iv_ = [[UIImageView alloc] initWithFrame:ivrect_];
            iv_.contentMode = UIViewContentModeScaleAspectFill;
            iv_.clipsToBounds = true;
            iv_.image = image_;
            [_scrollview addSubview:iv_];
            index_++;
        }
    }
    return self;
}

-(void)ButtonPushed:(UIButton*)button{
    int page_ = (int)round(_scrollview.contentOffset.x / _scrollview.frame.size.width);
    /**
     *  scroll or finish
     */
    if (page_!=(_images.count-1)) {
        CGRect rect = _scrollview.frame;
        rect.origin.x = rect.size.width * (page_+1);
        [_scrollview scrollRectToVisible:rect animated:true];
    }else{
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page_ = (int)round(scrollView.contentOffset.x / scrollView.frame.size.width);
    if (page_==_images.count-1) {
        [_button setTitle:startText forState:UIControlStateNormal];
    }else{
        [_button setTitle:nextText forState:UIControlStateNormal];
    }
    _pgcontrol.currentPage = page_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

UIImage *(^createImageFromUIColor)(UIColor *) = ^(UIColor *color)
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [color CGColor]);
    CGContextFillRect(contextRef, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
};

@end
