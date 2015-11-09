//
//  TableViewController.h
//  lab3
//
//  Created by Ernst Haagsman on 11/8/15.
//  Copyright © 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

-(void) setBuildings: (NSMutableArray *) buildings;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
