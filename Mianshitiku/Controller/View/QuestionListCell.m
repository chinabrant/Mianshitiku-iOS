//
//  QuestionListCell.m
//  Mianshitiku
//
//  Created by wusj on 14-5-16.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "QuestionListCell.h"
#import "UIView+Positioning.h"
#define LabelWidth 300

@implementation QuestionListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindData:(AVObject *)data
{
//    NSLog(@"---------> %@", [data valueForKey:@"title"]);
    self.titleLabel.x = 10;
    self.titleLabel.y = 7;
//    NSLog(@"height : %f", [QuestionListCell cellHeightWithData:data]);
    self.titleLabel.height = [QuestionListCell cellHeightWithData:data] - 15;
    self.titleLabel.text = [data valueForKey:@"title"];
}

+ (float)cellHeightWithData:(AVObject *)data
{
    float hei = [PublicFunction getTextContentHeight:[data valueForKey:@"title"] font:[UIFont systemFontOfSize:17] limitWidth:LabelWidth];
    // 20为上下的间隔
    return hei + 20;
}

@end
