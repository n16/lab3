//
//  TableViewController.m
//  lab3
//
//  Created by Ernst Haagsman on 11/8/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "TableViewController.h"
#import "LABBuilding.h"

@interface TableViewController (){
    NSMutableArray* _buildings;
    NSArray* searchResults;
}

@end

@implementation TableViewController

- (void)setBuildings:(NSMutableArray *)buildings
{
    _buildings = buildings;
    searchResults = buildings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

#pragma mark - Search Bar
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    // If the user entered anything, search a matching building, otherwise, display them all
    if (searchText.length > 0){
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"buildingName CONTAINS[cd] %@", searchText];
        searchResults = [_buildings filteredArrayUsingPredicate:predicate];
    } else {
        searchResults = _buildings;
    }
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    LABBuilding *building = [searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = building.buildingName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
