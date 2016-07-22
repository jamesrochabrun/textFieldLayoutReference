//
//  ViewController.m
//  test1
//
//  Created by James Rochabrun on 20-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldView.h"
#import "CommentPhotoView.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) TextFieldView *textView;
@property (nonatomic, strong) CommentPhotoView *commentPhotoView;
@property (nonatomic, strong) CommentPhotoView *secondCommentView;
@property (nonatomic, strong) NSMutableArray *commentsButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [super viewDidLoad];
    
    _textView = [TextFieldView new];
    [_textView.postTextButton setTitle:@"Show View" forState:UIControlStateNormal];
    
    [_textView.postTextButton addTarget:self
                                 action:@selector(test)
                       forControlEvents:UIControlEventTouchUpInside];
    
    _textView.postTextButton.backgroundColor = [UIColor redColor];
    _textView.textField.delegate = self;
    
    [self.view addSubview:_textView];
    
    
//    _commentPhotoView = [CommentPhotoView new];
//    _commentPhotoView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:_commentPhotoView];
    
//    _secondCommentView = [CommentPhotoView new];
//    _secondCommentView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_secondCommentView];

    _commentsButton = [NSMutableArray new];
    
    CommentPhotoView *cPV;
    for (int i = 0; i <5; i++) {
        cPV = [CommentPhotoView new];
        [self.view addSubview:cPV];
        [_commentsButton addObject:cPV];
    }
    
    NSLog(@"the count of the array is %lu", _commentsButton.count);
}

- (void)test {
    NSLog(@"hello motherfucker");
}

- (void)viewWillLayoutSubviews {
    
    _textView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame) - 70, self.view.bounds.size.width, 70);
    _textView.backgroundColor = [UIColor yellowColor];
    //_commentPhotoView.frame = CGRectMake(0, CGRectGetMinY(self.view.frame), self.view.bounds.size.width,FLT_MAX);
    //_secondCommentView.frame = CGRectMake(0, CGRectGetMaxY(_commentPhotoView.frame),self.view.bounds.size.width ,FLT_MAX);
    
    CGRect frame;
    CGFloat y = CGRectGetMinY(self.view.frame);
    
    for (UIView *v in _commentsButton) {
        v.backgroundColor = [UIColor yellowColor];
        frame = v.frame;
        //manipulate frame here
        frame.origin.x = 0;
        frame.origin.y = y;
        frame.size.width = self.view.frame.size.width;
        y +=  frame.size.height;
        v.frame = frame;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"its been edited");
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"its been edited");
    
}

@end
