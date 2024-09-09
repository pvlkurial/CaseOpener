class DataController {

    Inventory@ inv;

    DataController(){
        @inv = Inventory();
        inv.loadInv();
    }

    array<Case@> getCases(){
        return inv.getCases();
    }

    array<Skin@> getSkins(){
        return inv.getSkins();
    }

    void loadTextures(){
        for(int i = 0; i < inv.getCases().Length; i++){
            @inv.getCases()[i].m_tex = UI::LoadTexture("assets/chroma.png");
        }
        
    }

    void getAllCases(){
        Json::Value res = Json::FromFile("assets/mock.json");
        print(tostring(res.Get("cases").Length));
    }

    void addSkinToInv(const string &in casename){
        inv.addSkin(genNewSkin(casename));
    }

    Skin genNewSkin(const string &in casename){
        Json::Value res = Json::FromFile("assets/mock.json");
        for(auto i = 0; i < res.Get("cases").Length; i++){
            
            if(res.Get("cases")[i].Get("name") == casename){
                int rand = Math::Rand(0, res.Get("cases")[i].Get("skins").Length-1);
                print(res.Get("cases")[i].Get("skins")[rand].Get("skinName"));
                return Skin(res.Get("cases")[i].Get("skins")[rand].Get("skinName"));
            }
        }
        return Skin("errorSkin");
        //print(tostring(res.Get("cases").Get(casename)));

    }

}