class Foodvariety < ActiveHash::Base
  self.data = [
      {id: 1, name: '寿司'}, {id: 2, name: '魚料理'}, {id: 3, name: '和食'},
      {id: 4, name: '麺類'}, {id: 5, name: '揚げ物'}, {id: 6, name: '丼'},
      {id: 7, name: 'お好み焼き'}, {id: 8, name: '郷土料理'}, {id: 9, name: '中華料理'},
      {id: 10, name: 'イタリアン'}, {id: 11, name: 'フレンチ'}, {id: 12, name: '洋食'},
      {id: 13, name: 'アメリカ料理'}, {id: 14, name: 'アフリカ料理'}, {id: 15, name: '焼肉・ステーキ'},
      {id: 16, name: '焼き鳥'}, {id: 17, name: '鍋'}, {id: 18, name: '居酒屋・バー'},
      {id: 19, name: 'カフェ・スイーツ'}, {id: 20, name: 'ファミレス'}, {id: 21, name: 'ビュッフェ'},
      {id: 22, name: 'ビアガーデン'}
  ]
end