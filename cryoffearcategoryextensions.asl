state("cof")
{
    float pausestate: "hw.dll",0x11119E4;
    float loadingstate: "hw.dll",0x10D279C;
    float cutscenestate: "client.dll",0x18ED64;
    string40 map: "hw.dll",0xF1AA15;
    string40 menu_map: "hw.dll",0x820495;
    float igt: "client.dll",0x1BE920;
    string40 music : "client.dll",0x5440C8;
    float canmove: "hw.dll",0x9FDC30;
}

start
{
    if((current.map=="c_rumpel1.bsp" && current.loadingstate==0)
    ||(current.map=="c_arvuti.bsp" && current.loadingstate==0)
    ||(current.map=="c_hallo_iambulletproof.bsp" && current.loadingstate==0)
    ||(current.map=="c_the_stairway1.bsp" && current.loadingstate==0)
    &&current.menu_map!=""
    &&current.menu_map!="c_difficulty_settings.bsp"
    &&current.menu_map!="c_game_menu1.bsp")  
    {
        return true;
    }
}

reset
{

    return ((current.map=="c_rumpel1.bsp"//memories 
    ||current.map=="c_arvuti.bsp"//community collaboration
    ||current.map=="c_hallo_iambulletproof.bsp"//halloween collaboration 
    ||current.map=="c_the_stairway1.bsp")//the stairway 
    &&old.igt!=0&&current.igt==0);

}

isLoading
{                       
    return (current.pausestate !=0)||(current.loadingstate ==0)
    ||(current.cutscenestate !=0&&current.canmove==0)
    ||(current.menu_map=="c_loadgame.bsp")
    ||(current.menu_map=="c_loadgame.bsp"&&current.loadingstate ==0)
    ||(current.menu_map=="c_difficulty_settings.bsp")
    ||(current.menu_map=="c_game_menu1.bsp");
}

split
{
    return old.map!=current.map
    &&current.map!="c_game_menu1.bsp"
    &&old.map!="c_game_menu1.bsp"
    &&current.map!="c_game_menu1.bsp"
    &&current.map!=""
    ||(current.music=="survive_hotel_terror.mp3")//halloween collaboration 
    ||(current.music=="lifelover.mp3")//memories 
    ||(current.music=="endmusic4.mp3")//the stairway 
    ||(current.map=="c_collab_credits.bsp");//community collaboration
  
}
