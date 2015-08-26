# jigglypuff
iOS libs


[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](https://youtu.be/P_Ke6HmlDvY)

Demo :
https://appetize.io/app/v2r5729w8q3f3xyrpf1d2vzk0w?device=iphone5s&scale=75&orientation=portrait



Documention :


    #import "OMenuManager.h"
    
    manager = [[OMenuManager alloc] init];
    manager.delegate = self;
    manager.dataSource = self; // u dont wantto use datasource OR use itemNameArr, 
    // manager.itemNameArr = itemsArr; its enought for menu items
    [manager addMenuButton:self.btnMenu animation:YES];
    
    
Data Source Methods
    #pragma mark - menu datasource
    - (NSInteger)numberOfRowInMenuItems {
        return [itemsArr count];
    }

    - (OMenuItem *)menuManager:(OMenuManager *)manager menuItemForRow:(NSInteger)row {
        OMenuItem* item = [[OMenuItem alloc] init];
        item.name = [itemsArr objectAtIndex:row];
        [item defaultDesign];
        return item;
    }

Delegate Methods 
      #pragma mark - menu delegate
      - (void)menuVC:(OMenuViewController *)menuVC didSelectItem:(OMenuItem *)item {
        
      }
      - (void)menuVC:(OMenuViewController *)menuVC pressedMenuBtn:(UIButton *)btnMenu {
        
      }
    
      - (void)menuVC:(OMenuViewController *)menuVC viewDidHide:(BOOL)isHide {
        
      }

  
