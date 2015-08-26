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

  
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons Lisansı" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br /><a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/twentify/jigglypuff" property="cc:attributionName" rel="cc:attributionURL">omer</a> isimli yazarın <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">jigglypuff</span> başlıklı eseri bu <a rel="license" href="http://creativecommons.org/licenses/by/4.0/"> Creative Commons Alıntı 4.0 Uluslararası Lisansı </a> ile lisanslanmıştır.
