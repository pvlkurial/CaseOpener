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
    Json::Value res = Json::FromFile("assets/mock.json");
    for(int i = 0; i < res.Get("cases").Length; i++){
        cases.InsertLast(Case(res.Get("cases")[i].Get("name"), "assets/chroma.png"));
    }

    for(int i = 0 ; i < cases.Length; i++){
        print(cases[i].m_name);
    }

    @controller = ViewController();

}

void Render(){

    UI::Begin("Window", UI::WindowFlags::None);
    UI::BeginTabBar("##id1", UI::TabBarFlags::None );
    UI::BeginTabItem("ben", true, UI::TabItemFlags::None);
    
    controller.renderView();
    
    UI::EndTabItem();
    UI::EndTabBar();
    
    


    UI::End();
}