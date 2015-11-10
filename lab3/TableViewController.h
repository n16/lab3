//
//  TableViewController.h
//  lab3
//
//  Created by Ernst Haagsman on 11/8/15.
//  Copyright © 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LABBuilding.h"

@protocol buildingSearchResult<NSObject>

-(void)goToBuilding: (LABBuilding *) building;

@end

@interface TableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic,assign)id delegate;

@property (weak, nonatomic)IBOutlet UITableView *tableView;

-(void) setBuildings: (NSMutableArray *) buildings;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;

-(IBAction)goBack:(id)sender;

@end
