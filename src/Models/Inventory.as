class Inventory {

    array<Case@> cases;
    array<Skin@> skins;

    Inventory(){
        cases = {};
        skins = {};
    }

    void loadInv(){
        // lets say it gets data from inventory, for the time being its general
        Json::Value res = Json::FromFile("assets/mock.json");
        for(int i = 0; i < res.Get("cases").Length; i++){
            cases.InsertLast(Case(res.Get("cases")[i].Get("name"), "assets/chroma.png"));
        }
    }

    array<Case@> getCases(){
        return cases;
    }

    array<Skin@> getSkins(){
        return skins;
    }

    void addSkin(Skin & skin){
        skins.InsertLast(Skin("newSkin"));
        print(tostring(skins.Length));
    }


}