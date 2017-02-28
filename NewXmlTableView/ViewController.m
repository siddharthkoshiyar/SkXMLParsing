//
//  ViewController.m
//  NewXmlTableView
//
//  Created by Student P_04 on 27/12/16.
//  Copyright © 2016 technoMatrix........ All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = @"http://images.apple.com/main/rss/hotnews/hotnews.rss#sthash.TyhRD7Zy.dpuf";
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSXMLParser *xml = [[NSXMLParser alloc]initWithContentsOfURL:url];
    xml.delegate = self;
    [xml parse];
    if (array.count!=0) {
        
  
    [_tblView reloadData];
    }
    NSLog(@"%@",array);
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ([elementName isEqualToString:@"channel"]) {
        array = [[NSMutableArray alloc]init];
        
    }
    if ([elementName isEqualToString:@"item"]) {
        dictionary = [[NSMutableDictionary alloc]init];
    }
    
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"title"]||[elementName isEqualToString:@"description"]) {
        [dictionary setObject:globalString forKey:elementName];
    }
    if ([elementName isEqualToString:@"item"]) {
        [array addObject:dictionary];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (globalString == nil) {
        globalString = [[NSMutableString alloc]initWithString:string];
    }
    else{
        globalString = [string mutableCopy];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=@"Cell";
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
   // UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    
//    if (cell==nil)
//    {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
//    }
    NSDictionary *temp;
    temp=[array objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines=0;


    cell.textLabel.text=[temp valueForKey:@"title"];
    
    cell.detailTextLabel.text=[temp valueForKey:@"link"];
    //cell.accessoryType= UITableViewCellAccessoryCheckmark;
    //cell.textLabel.textColor = [UIColor blueColor];
   // cell.detailTextLabel.textColor = [UIColor greenColor];
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
