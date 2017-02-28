//
//  ViewController.h
//  NewXmlTableView
//
//  Created by Student P_04 on 27/12/16.
//  Copyright © 2016 technoMatrix........ All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *array;
    NSMutableDictionary *dictionary;
    NSMutableString *globalString;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tblView;

@end

