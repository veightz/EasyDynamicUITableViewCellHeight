//
//  ViewController.m
//  TableView
//
//  Created by Veight Zhou on 15/10/16/.
//  Copyright © 2015 Veight Zhou. All rights reserved.
//

#import "ViewController.h"

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableview];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (!(self.isViewLoaded && self.view.window)) {
        self.tableview = nil;
        self.selectedIndexPath = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44 * ([indexPath isEqual:self.selectedIndexPath] ? 2 : 1);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.selectedIndexPath isEqual:indexPath]) {
        self.selectedIndexPath = nil;
    } else  {
        self.selectedIndexPath = indexPath;
    }
    [tableView beginUpdates];
    [tableView endUpdates];
}

@end
