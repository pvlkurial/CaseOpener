//[Setting hidden]
array<Skin@> skins;
//[Setting hidden]
array<Case@> cases;


ViewController@ controller;

bool isToLoad = true;

void Main() {
    print("Hello world");

    // Set the controller for UI -> Controller sets displayed UI and Fetch Data (Inventory)
    
    // instantiate cases here to an array manually
    // get json file -> iterate through objects and Consctruct cases objects into array
    

    @controller = ViewController();

}

void Render(){

    UI::Begin("TItle", UI::WindowFlags::None);

    controller.tabBar();

    UI::End();
}