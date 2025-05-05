local itemupentry=11940  ---吸血蝙蝠宝宝
local itemupmoney=1000  --金币手续费
local itemuppercent=100
local itemupreqitem1=47241 itemupreqnum1=100 ---"凯旋纹章"  杀怪奖励
local itemupreqitem2=40752 itemupreqnum2=10 --英雄纹章 BOSS奖励
local itemupreqitem3=37836 itemupreqnum3=50  ---兑换属性物品：风险硬币
local itemupreqitem4=44990  ---冠军的徽记 装备回收
local itemuplevel=0
local itemupaddlevel=0
local itemupspeitem=4492 itemupmaxlevel=0  ---精灵宝石
local useitem=0


-- 定义物品 ID
local itemID = 5566
-- 定义数字表，用于选择附魔个数
local fmslot = {0, 1, 5, 7}-----想减少附魔条数就调整对应数字，1条就是1；2条就是1，2；依次类推

local itemuptype = {
        {"|TInterface/ICONS/INV_Helmet_51:30:30|t头盔", 0},
		{"|TInterface/ICONS/INV_Jewelry_Necklace_02:30:30|t项链", 1},
        {"|TInterface/ICONS/INV_Shoulder_05:30:30|t肩膀", 2},
		{"|TInterface/ICONS/INV_Shoulder_05:30:30|t衬衣", 3},
		{"|TInterface/ICONS/INV_Shoulder_05:30:30|t战袍", 18},
        {"|TInterface/ICONS/INV_Chest_Plate03:30:30|t胸部", 4},
		{"|TInterface/ICONS/INV_Belt_28:30:30|t腰带", 5},
        {"|TInterface/ICONS/INV_Pants_06:30:30|t护腿", 6},
        {"|TInterface/ICONS/INV_Boots_Cloth_08:30:30|t靴子", 7},
        {"|TInterface/ICONS/INV_Bracer_32B:30:30|t护腕", 8},
        {"|TInterface/ICONS/INV_Gauntlets_19:30:30|t手套", 9},
		{"|TInterface/ICONS/INV_Jewelry_Ring_23:30:30|t戒指①", 10},
		{"|TInterface/ICONS/INV_Jewelry_Ring_22:30:30|t戒指②", 11},
		--{"|TInterface/ICONS/INV_Jewelry_Talisman_09:30:30|t饰品①", 12},
		--{"|TInterface/ICONS/INV_Jewelry_Talisman_10:30:30|t饰品②", 13},
        {"|TInterface/ICONS/INV_Misc_Cape_Naxxramas_02:30:30|t披风", 14},
        --{"|TInterface/ICONS/INV_Weapon_Glave_01:30:30|t主手", 15},
        --{"|TInterface/ICONS/INV_Weapon_Halberd_05:30:30|t双手武器", 151},
        --{"|TInterface/ICONS/INV_Weapon_ShortBlade_03:30:30|t副手武器", 16},
        {"|TInterface/ICONS/INV_Shield_53:30:30|t盾牌", 161},
        {"|TInterface/ICONS/INV_Weapon_Bow_17:30:30|t远程", 17}
		
		}
-- 定义升级对应的附魔表技能表  升级等级，成功率，力量，敏捷，智力，耐力
local itemupspell = {     --附魔技能自己添加可以去 SpellItemEnchantment.dbc 查看，也可以增加修改自己需要的技能
{1,itemuppercent,68,74,79,71},
{2,itemuppercent,69,75,80,72},
{3,itemuppercent,70,76,81,73},
{4,itemuppercent,106,90,94,102},
{5,itemuppercent,107,91,95,103},
{6,itemuppercent,108,92,96,104},
{7,itemuppercent,109,93,97,105},
{8,itemuppercent,352,343,350,353},
{9,itemuppercent,357,349,354,356},
{10,itemuppercent,362,358,359,361},
{11,itemuppercent,367,363,364,366},
{12,itemuppercent,372,368,369,371},
{13,itemuppercent,410,403,405,409},
{14,itemuppercent,412,404,406,411},
{15,itemuppercent,684,883,1118,1068},
{16,itemuppercent,1043,983,1119,1069},
{17,itemuppercent,1044,1094,1120,1070},
{18,itemuppercent,1045,1095,1121,1071},
{19,itemuppercent,1046,1096,1122,1072},
{20,itemuppercent,1047,1097,1123,1073},
{21,itemuppercent,1048,1098,1124,1074},
{22,itemuppercent,1049,1099,1125,1075},
{23,itemuppercent,1050,1100,1126,1076},
{24,itemuppercent,1051,1101,1127,1077},
{25,itemuppercent,1052,1102,1128,1078},
{26,itemuppercent,1053,1103,1129,1079},
{27,itemuppercent,1054,1104,1130,1080},
{28,itemuppercent,1055,1105,1131,1081},
{29,itemuppercent,1056,1106,1132,1082},
{30,itemuppercent,1057,1107,1133,1083},
{31,itemuppercent,1058,1108,1134,1084},
{32,itemuppercent,1059,1109,1135,1085},
{33,itemuppercent,1060,1110,1136,1086},
{34,itemuppercent,1061,1111,1137,1087},
{35,itemuppercent,1062,1112,1138,1088},
{36,itemuppercent,1063,1113,1139,1089},
{37,itemuppercent,1064,1114,1140,1090},
{38,itemuppercent,1065,1115,1141,1091},
{39,itemuppercent,1066,1116,1142,1092},
{40,itemuppercent,1067,1117,1143,1093},
{41,itemuppercent,1203,1215,1221,1209},
{42,itemuppercent,1204,1216,1222,1210},
{43,itemuppercent,1205,1217,1223,1211},
{44,itemuppercent,1206,1218,1224,1212},
{45,itemuppercent,1207,1219,1225,1213},
{46,itemuppercent,1208,1220,1226,1214},

}

function itemupmenu(event, player, unit)

    --player:GossipMenuAddItem(3, "一键全身装备附魔",0,999,false,"是否要全身附魔？",fmtmoney*10000)
    for _, v in ipairs(itemuptype) do
        player:GossipMenuAddItem(3, "|cff0070d0 " .. v[1] .. ".|R", 0, v[2])	
    end
	
    player:GossipSendMenu(1, unit)
	
end

function itemupchargelist(player,useitem,object)
	player:MoveTo(0,player:GetX()+0.01,player:GetY(),player:GetZ())
	pguid=player:GetGUIDLow()
	itemguid=useitem:GetGUIDLow()
	upitementry=useitem:GetEntry()
	itemupmaxlevel=player:GetItemCount(itemupspeitem)
    local query = CharDBQuery("select uplevel from _lf_character_itemup where guid="..pguid.." and itemguid="..itemguid)
	if (query) then
	    itemuplevel=query:GetInt32(0)
	    else
		CharDBExecute("insert into _lf_character_itemup (guid,itemguid,uplevel) values("..pguid..","..itemguid..",0)")	
		itemuplevel=0
		end	

	--if speitem==0 then speitem=speitemlist[math.random(#speitemlist)][2] end
	--print(itemupreq1.."  "..itemupreqnum1)
	    --print(upitems[k][1].." "..upitems[k][5].." "..upitems[k][6])
		player:GossipClearMenu();
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Tradeskill_Inscription_JadeSerpent.blp:30|t 当前装备:"..GetItemLink(upitementry)..",当前等级："..itemuplevel,0,99);
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Tradeskill_Inscription_RedCrane.blp:30|t |cFFFF0000可提升等级:"..GetItemLink(itemupspeitem).."×"..itemupmaxlevel.."级|r",0,99);		
	    player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Tradeskill_Inscription_RedCrane.blp:30|t 需要材料1:"..GetItemLink(itemupreqitem1).."×"..math.floor(itemupreqnum1*itemupaddlevel).."件",0,99);
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Tradeskill_Inscription_BlackOx.blp:30|t 需要材料2:"..GetItemLink(itemupreqitem2).."×"..math.floor(itemupreqnum2*itemupaddlevel).."件",0,99);
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Tradeskill_Inscription_RedCrane.blp:30|t 需要材料3:"..GetItemLink(itemupreqitem3).."×"..math.floor(itemupreqnum3*itemupaddlevel).."件",0,99);
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Spell_Priest_Chakra.blp:30|t 需要金币:"..itemupmoney*itemupaddlevel.."G",0,99);
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Spell_Priest_VowofUnity.blp:30|t 成功几率:"..itemuppercent.."%",0,99);
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Spell_Priest_VowofUnity.blp:30|t |cFF0000FF本次升级:"..itemupaddlevel.."级|r",0,88);		
		player:GossipMenuAddItem(1,"|TInterface\\ICONS\\Spell_Holy_HopeAndGrace.blp:40|t |CFFFF1100确认升级|R",1,9999,false,"确认要升级装备吗?",math.floor(itemupmoney*itemupaddlevel*10000));
		player:GossipSendMenu(1,object);


end


function itemupdo(player,useitem)
       playerclass=	 player:GetClass()  
--CLASS_WARRIOR  = 1 --战士 CLASS_PALADIN = 2 --圣骑士  CLASS_HUNTER = 3 --猎人 CLASS_ROGUE = 4 --盗贼
--CLASS_PRIEST = 5 --牧师  CLASS_DEATH_KNIGHT = 6 --死亡骑士 CLASS_SHAMAN = 7 --萨满 CLASS_MAGE = 8 --法师
--CLASS_WARLOCK = 9 --术士 CLASS_Warriormonk = 10 --武僧 CLASS_DRUID = 11 --德鲁伊 CLASS_DemonHunter = 12 --恶魔猎手	   
        if playerclass==1 then fmspelltype=1 end --战士：力量 耐力
		if playerclass==2 then fmspelltype=1 end --圣骑士：力量 耐力
		if playerclass==3 then fmspelltype=2 end --猎人：敏捷 耐力
		if playerclass==4 then fmspelltype=2 end --盗贼：敏捷 耐力
		if playerclass==5 then fmspelltype=3 end --牧师：智力 耐力
		if playerclass==6 then fmspelltype=1 end --死亡骑士：力量 耐力
		if playerclass==7 then fmspelltype=3 end --萨满：智力 耐力
		if playerclass==8 then fmspelltype=3 end --法师：智力 耐力
		if playerclass==9 then fmspelltype=3 end --术士：智力 耐力
		if playerclass==10 then fmspelltype=2 end --武僧：敏捷 耐力
		if playerclass==11 then fmspelltype=3 end --德鲁伊：智力 耐力
		if playerclass==12 then fmspelltype=2 end --恶魔猎手：敏捷 耐力
	if itemupaddlevel~=0 then
        if (player:HasItem(itemupreqitem1,itemupreqnum1*itemupaddlevel)==false or player:HasItem(itemupreqitem2,itemupreqnum2*itemupaddlevel) == false or player:HasItem(itemupreqitem3,itemupreqnum3*itemupaddlevel) == false) then
	        player:GossipComplete()	
		    player:SendBroadcastMessage("|CFFFF0000升级材料不够，请准备好了再来升级！！|R");
            else
		   itemuplevel=itemuplevel+itemupaddlevel
		   --print(itemuplevel)
	       local fmspell1=itemupspell[itemuplevel][3]
	       local fmspell2=itemupspell[itemuplevel][4]
	       local fmspell3=itemupspell[itemuplevel][5]
	       local fmspell4=itemupspell[itemuplevel][6]
		  -- fmspell1=68 fmspell2=3015 fmspell3=70 fmspell4=2892 fmspell5=4739 fmspell6=108 fmspell7=109 fmspell8=352 fmspell9=357 fmspell10=362 fmspell11=367
	       useitem:ClearEnchantment(0)
           useitem:SetEnchantment(fmspell1, 0)
	       useitem:ClearEnchantment(1)
           useitem:SetEnchantment(fmspell2, 1)	
	       useitem:ClearEnchantment(5)
           useitem:SetEnchantment(fmspell3, 5)	
	       useitem:ClearEnchantment(7)
           useitem:SetEnchantment(fmspell4, 7)
           --useitem:SetName(useitem:GetName()..itemuplevel.."级")
		  player:RemoveItem(itemupreqitem1,itemupreqnum1*itemupaddlevel)
		  player:RemoveItem(itemupreqitem2,itemupreqnum2*itemupaddlevel)
		  player:RemoveItem(itemupreqitem3,itemupreqnum3*itemupaddlevel)
		  player:RemoveItem(itemupspeitem,itemupaddlevel)
          player:ModifyMoney(-itemupmoney*itemupaddlevel*10000)--扣费
		  CharDBExecute("update _lf_character_itemup set uplevel="..itemuplevel.." where guid="..pguid.." and itemguid="..itemguid)	
          player:SendBroadcastMessage("|cFFFF0000装备升级完成，扣除手续费"..itemupmoney*itemupaddlevel.."G！！！|r")	
	      SendWorldMessage("|cFFFF0000[临风装备升级]|r玩家|cFF00FF00["..player:GetName().."]|r将装备"..GetItemLink(upitementry).."升到了【"..itemuplevel.."】级，属性大大增强大了！！")
	      player:GossipComplete()		   
		  end  
	    elseif itemuplevel~=0 then
	       local fmspell1=itemupspell[itemuplevel][3]
	       local fmspell2=itemupspell[itemuplevel][4]
	       local fmspell3=itemupspell[itemuplevel][5]
	       local fmspell4=itemupspell[itemuplevel][6]
	       useitem:ClearEnchantment(0)
           useitem:SetEnchantment(fmspell1, 0)
	       useitem:ClearEnchantment(1)
           useitem:SetEnchantment(fmspell2, 1)	
	       useitem:ClearEnchantment(5)
           useitem:SetEnchantment(fmspell3, 5)	
	       useitem:ClearEnchantment(7)
           useitem:SetEnchantment(fmspell4, 7)		
	       player:GossipComplete()	
	       player:SendBroadcastMessage("|CFFFF0000你的装备升级属性已经重新加载！！！|R");
          --end		  
	else	   
	player:GossipComplete()	
	player:SendBroadcastMessage("|CFFFF0000请先确认本次升级等级！！|R");
  end
end


function itemuprun(event, player, object, sender, intid, code, menu_id)

  if intid==88 then
    if itemuplevel+itemupaddlevel>46 then
	   player:SendBroadcastMessage("|cFFFF0000你的装备已提升到最大等级，目前不需要再升级！！！|r")
	   else if itemupaddlevel<itemupmaxlevel then
	   itemupaddlevel=itemupaddlevel+1
	   itemupchargelist(player,useitem,object)
	   else
	   player:SendBroadcastMessage("|cFFFF0000精灵宝石不足无法升级，你可以通过转生、击杀BOSS等方式获得！！！|r")
	   end
	 end  
  end
  if intid~=9999 and intid~=88 and intid~=99 then  
      useitem = player:GetEquippedItemBySlot(intid)
	  itemupaddlevel=0
	  if useitem then
		itemupchargelist(player,useitem,object)

		else
		player:SendBroadcastMessage("|cFFFF0000你没有装备，无法进行装备升级！！！|r")
		player:GossipComplete()
		end
	  else if intid==99 then
		player:SendBroadcastMessage("|cFFFF0000请点击装备升级菜单进行升级！！！|r")
		player:GossipComplete()  
           end		
 	end		
    if intid==9999 then
	   if itemuplevel<=46 then
          itemupdo(player,useitem)
	      else
		player:SendBroadcastMessage("|cFFFF0000你的装备已提升到最大等级，目前不需要再升级！！！|r")
		player:GossipComplete() 
		  end
		  
       end	
		

end


-- 清除附魔
function clearEnchantments(item, target)
    local slots = {1, 2, 3, 4, 5}-----想减少附魔条数就调整对应数字，1条就是1；2条就是1，2；依次类推
    for _, slot in ipairs(slots) do
        if item:GetEnchantmentId(slot) then
            target:ClearEnchantment(slot)
        end
    end
end


-- 应用附魔
function applyEnchantments(target, enchantments)
    local slots = {1, 2, 3, 4, 5}-----想减少附魔条数就调整对应数字，1条就是1；2条就是1，2；依次类推
    for i, enchantment in ipairs(enchantments) do
        target:SetEnchantment(enchantment, slots[i])
    end
end


CharDBExecute([[
CREATE TABLE IF NOT EXISTS `_lf_character_itemup` (    
  `guid` int(11) NOT NULL,
  `itemguid` int(11) NOT NULL DEFAULT '0',
  `uplevel` int(11) NOT NULL DEFAULT '0'
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
]])


-- 注册物品使用事件
--RegisterItemEvent(itemID, 2, UseItemEvent)
RegisterCreatureGossipEvent(itemupentry, 1, itemupmenu)
RegisterCreatureGossipEvent(itemupentry, 2, itemuprun)

print("<<<lflua17>>>Script: itemup system...OK啊 ")



