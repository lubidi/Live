//
//  ZJRecommentModel.h
//  TRProject
//
//  Created by tarenaios on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class List,LinkObject,MobileBeauty,MobileStar;
@interface ZJRecommentModel : NSObject

//moblie-webgame - >mobliewebgame
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobliewebgame;
//moblie-minecraft- >moblieminecraft
@property (nonatomic, strong) NSArray<MobileBeauty *> *moblieminecraft;
//mobile-tvgame ->mobiletvgame
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobiletvgame;
//moblie-sport - > mobliesport
@property (nonatomic, strong) NSArray<MobileBeauty*> *mobliesport;
//mobile-star -> mobilestar
@property (nonatomic, strong) NSArray<MobileStar *> *mobilestar;
//mobile-recommendation ->mobilerecommendation
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobilerecommendation;
//mobile-index - > mobileindex
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileindex;
//mobile-lol ->mobilelol
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobilelol;
//mobile-beauty - >mobilebeauty
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobilebeauty;
//mobile-heartstone - >mobileheartstone
@property (nonatomic, strong) NSArray<MobileBeauty*> *mobileheartstone;
//moblie-blizzard - >moblieblizzard
@property (nonatomic, strong) NSArray<MobileBeauty *> *moblieblizzard;

@property (nonatomic, strong) NSArray<List *> *list;
//mobile-dota2->mobiledota2
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobiledota2;
//moblie-dnf->mobliednf
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobliednf;
@end

@interface List : NSObject

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *name;

@end


@interface MobileStar : NSObject
//id- >ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger slot_id;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, strong) LinkObject *link_object;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface MobileBeauty : NSObject

@property (nonatomic, strong) LinkObject *link_object;

@end

@interface LinkObject : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weight_add;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *play_count;

@property (nonatomic, copy) NSString *negative_view;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coin_add;

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_name;
//new_start_time ->newstarttime
@property (nonatomic, copy) NSString *newstarttime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *locked_view;
//last_end_at->lastendat
@property (nonatomic, copy) NSString *lastendat;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *announcement;
//first_play_at- >firstplayat
@property (nonatomic, copy) NSString *firstplayat;

@property (nonatomic, copy) NSString *follow;

@property (nonatomic, copy) NSString *follow_bak;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *weight;
//app_shuffling_image ->appshufflingimage
@property (nonatomic, copy) NSString *appshufflingimage;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_slug;

@end



