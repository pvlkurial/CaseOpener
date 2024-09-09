class Skin : BaseItem {
    
    uint16 m_rarity;
    bool m_stattrak;
    float m_wear;
    string grade;
    Case m_case;

    float genWear(){
        return Math::Rand(0.0f, 1.0f);
    }

    // Best rarity goes from 
    uint16 genRarity(){
        uint16 num = Math::Rand(0,9999);
        if(num > 26){
            if(num > 90){
                if(num > 410){
                    if(num > 2008){
                        return 4;
                    }
                    return 3;
                }
                return 2;
            }
            return 1;
        }else{
            return 0;
        }
    }


    Skin(const string &in name){
        m_name = name;
        m_wear = genWear();
        @m_tex = UI::LoadTexture("assets/chroma.png");
        print("Created a new skin!");
    }
    Skin(){}




}