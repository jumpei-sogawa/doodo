# Prefecture.create(name: "東京都")
# Prefecture.create(name: "神奈川県")
# Prefecture.create(name: "大阪府")
# Prefecture.create(name: "京都府")
# Prefecture.create(name: "兵庫県")
# Prefecture.create(name: "愛知県")
# Prefecture.create(name: "北海道")
# Prefecture.create(name: "青森県")
# Prefecture.create(name: "岩手県")
# Prefecture.create(name: "宮城県")
# Prefecture.create(name: "秋田県")
# Prefecture.create(name: "山形県")
# Prefecture.create(name: "福島県")
# Prefecture.create(name: "茨城県")
# Prefecture.create(name: "栃木県")
# Prefecture.create(name: "群馬県")
# Prefecture.create(name: "埼玉県")
# Prefecture.create(name: "千葉県")
# Prefecture.create(name: "新潟県")
# Prefecture.create(name: "富山県")
# Prefecture.create(name: "石川県")
# Prefecture.create(name: "福井県")
# Prefecture.create(name: "山梨県")
# Prefecture.create(name: "長野県")
# Prefecture.create(name: "岐阜県")
# Prefecture.create(name: "静岡県")
# Prefecture.create(name: "三重県")
# Prefecture.create(name: "滋賀県")
# Prefecture.create(name: "奈良県")
# Prefecture.create(name: "和歌山県")
# Prefecture.create(name: "鳥取県")
# Prefecture.create(name: "島根県")
# Prefecture.create(name: "岡山県")
# Prefecture.create(name: "広島県")
# Prefecture.create(name: "山口県")
# Prefecture.create(name: "徳島県")
# Prefecture.create(name: "香川県")
# Prefecture.create(name: "愛媛県")
# Prefecture.create(name: "高知県")
# Prefecture.create(name: "福岡県")
# Prefecture.create(name: "佐賀県")
# Prefecture.create(name: "長崎県")
# Prefecture.create(name: "熊本県")
# Prefecture.create(name: "大分県")
# Prefecture.create(name: "宮崎県")
# Prefecture.create(name: "鹿児島県")
# Prefecture.create(name: "沖縄県")

# Museum.create(
#     prefecture_id: 1,
#     name: "",
#     address: "",
#     phone: "",
#     website: ""
# )
# Exhibition.create(
#     museum_id: 1,
#     name: "",
#     start_date: Date.new(2020,3,3),
#     end_date: Date.new(2020,6,14),
#     fee: "aaa\naaa",
#     closing_day: "",
#     opening_hours: "",
#     phone: "",
#     organizer: "",
#     website: ""
# )

# # #1
# # Museum.create(
# # 	prefecture_id: 1,
# # 	name: "国立西洋美術館",
# # 	address: "東京都台東区上野公園7-7",
# # 	phone: "03-5777-8600",
# # 	website: "https://www.nmwa.go.jp/",
# # 	image: "https://artscape.jp/mdb/image/1195763.jpg"
# # )
# # #1
# Exhibition.create(
# 	museum_id: 1,
# 	name: "ロンドン・ナショナル・ギャラリー展",
# 	start_date: Date.new(2020,3,3),
# 	end_date: Date.new(2020,6,14),
# 	fee: "一般＝1,700（1,500）円\n大学生＝1,100（1,000）円\n高校生＝700（600）円\n＊（　）内は前売および20人以上の団体料金\n＊中学生以下は無料\n＊心身に障害のある方および付添者1名は無料（入館の際に障害者手帳をご提示ください）",
# 	closing_day: "月曜日（3/30、5/4は開館）",
# 	opening_hours: "9：30～17：30（金・土は20時まで開館、入館は閉館の30分前まで）",
# 	phone: "03-5777-8600",
# 	organizer: "国立西洋美術館、ロンドン・ナショナル・ギャラリー、読売新聞社、日本テレビ放送網",
# 	website: "https://www.nmwa.go.jp/jp/exhibitions/2020london_gallery.html",
# 	image: "https://artscape.jp/exhibition/pickup/image/2003_o_05.jpg"
# )

# # #2
# # Museum.create(
# # 	prefecture_id: 1,
# # 	name: "森美術館",
# # 	address: "東京都港区六本木6-10-1 六本木ヒルズ森タワー53F",
# # 	phone: "03-5777-8600",
# # 	website: "https://www.mori.art.museum/",
# # 	image: "https://artscape.jp/mdb/image/1195842.jpg"
# # )
# # #2
# Exhibition.create(
# 	museum_id: 2,
# 	name: "未来と芸術展：AI、ロボット、都市、生命――人は明日どう生きるのか",
# 	start_date: Date.new(2019,11,19),
# 	end_date: Date.new(2020,3,29),
# 	fee: "一般　 1,800円\n学生（高校・大学生）1,200円\n子供（4歳～中学生）600円\nシニア（65歳以上）1,500円",
# 	closing_day: "会期中無休",
# 	opening_hours: "10：00～22：00（火曜日のみ17時まで、ただし11/19、12/31、2/11は22時まで開館。最終入館は閉館の30分前まで）",
# 	phone: "03-5777-8600",
# 	organizer: "森美術館、NHK",
# 	website: "https://www.mori.art.museum/",
# 	image: "https://artscape.jp/exhibition/pickup/image/1911_o_03.jpg"
# )

# # #3
# # Museum.create(
# # 	prefecture_id: 2,
# # 	name: "横浜美術館",
# # 	address: "神奈川県横浜市西区みなとみらい3-4-1",
# # 	phone: "045-221-0300",
# # 	website: "https://yokohama.art.museum/",
# # 	image: "https://artscape.jp/mdb/image/1195883.jpg"
# # )
# # #3
# Exhibition.create(
# 	museum_id: 3,
# 	name: "コレクション展　横浜美術館の西洋美術　木版挿絵からボルタンスキーまで—絵画・版画・写真・彫刻",
# 	start_date: Date.new(2020,2,15),
# 	end_date: Date.new(2020,5,24)
# )

# # #4
# # Museum.create(
# # 	prefecture_id: 3,
# # 	name: "あべのハルカス美術館",
# # 	address: "大阪府大阪市阿倍野区阿倍野筋1-1-43　あべのハルカス16F",
# # 	phone: "06-4399-9050",
# # 	website: "https://www.aham.jp/",
# # )
# # #4
# Exhibition.create(
# 	museum_id: 4,
# 	name: "国宝東塔大修理落慶記念　薬師寺展",
# 	start_date: Date.new(2020,2,28),
# 	end_date: Date.new(2020,4,19)
# )

# # #5
# # Museum.create(
# # 	prefecture_id: 4,
# # 	name: "京都国立近代美術館",
# # 	address: "京都府京都市左京区岡崎円勝寺町26-1",
# # 	phone: "075-761-4111",
# # 	website: "http://www.momak.go.jp/",
# # 	image: "https://artscape.jp/mdb/image/1196138.jpg"
# # )
# # #5
# Exhibition.create(
# 	museum_id: 5,
# 	name: "チェコ・デザイン　100年の旅",
# 	start_date: Date.new(2020,3,6),
# 	end_date: Date.new(2020,5,10)
# )

# # #6
# # Museum.create(
# # 	prefecture_id: 5,
# # 	name: "兵庫県立美術館",
# # 	address: "兵庫県神戸市中央区脇浜海岸通1-1-1",
# # 	phone: "078-262-0901",
# # 	website: "https://www.artm.pref.hyogo.jp/",
# # 	image: "https://artscape.jp/mdb/image/1196219.jpg"
# # )
# # #6
# Exhibition.create(
# 	museum_id: 6,
# 	name: "ゴッホ展",
# 	start_date: Date.new(2020,1,25),
# 	end_date: Date.new(2020,3,29),
# )

# # #7
# # Museum.create(
# # 	prefecture_id: 6,
# # 	name: "愛知県美術館",
# # 	address: "愛知県名古屋市東区東桜1-13-2 愛知芸術文化センター10F",
# # 	phone: "052-971-5511",
# # 	website: "https://www-art.aac.pref.aichi.jp/"
# # )

# #1
# Artist.create(
# 	name: "フォスター＋パートナーズ",
# 	place: "ロンドン",
# 	birth_year: 1967,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 1,
# 	name: "マスダール・シティ（写真・スライドショー）",
# 	year: 2019,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 1,
# 	name: "マスダール・シティ（映像）",
# 	year: 2013
# )

# #2
# Artist.create(
# 	name: "ビャルケ・インゲルス・グループ",
# 	place: "コペンハーゲン",
# 	birth_year: 2005,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 2,
# 	name: "オーシャニクス・シティ（写真・スライドショー）",
# 	year: 2019
# )

# #3
# Artist.create(
# 	name: "ポメロイ・スタジオ",
# 	place: "シンガポール",
# 	birth_year: 2012,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 3,
# 	name: "ポッド・オフグリッド（模型）",
# 	year: 2016
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 3,
# 	name: "ポッド・オフグリッド（写真）",
# 	year: 2019
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 3,
# 	name: "ポッド・オフグリッド（映像）",
# 	year: 2017
# )

# #4
# Artist.create(
# 	name: "MAD アーキテクツ",
# 	place: "北京",
# 	birth_year: 2004,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 1,
# 	name: "山水都市リサーチ（模型）",
# 	year: 2009
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 4,
# 	name: "朝陽公園プラザ（写真）",
# 	year: 2019
# )

# #5
# Artist.create(
# 	name: "XTU アーキテクツ",
# 	place: "パリ",
# 	birth_year: 2000,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 5,
# 	name: "X クラウド・シティ（模型）",
# 	year: 2019
# )

# #6
# Artist.create(
# 	name: "ヴァンサン・カレボー・アルシテクチュール",
# 	place: "パリ",
# 	birth_year: 2000,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 6,
# 	name: "2050 パリ・スマートシティ（写真）",
# 	year: 2019
# )

# #7
# Artist.create(
# 	name: "ネリ・オックスマン＆ザ・メディエイテッド・マター・グループ",
# 	place: "ニューヨーク",
# 	birth_year: 1976,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 7,
# 	name: "江戸のエデン",
# 	year: 2019
# )

# #8
# Artist.create(
# 	name: "ザ・ワイ・ファクトリー／デルフト工科大学",
# 	place: "オランダ",
# 	birth_year: 2007,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 8,
# 	name: "ポロ・シティ",
# 	year: 2019
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 8,
# 	name: "模型",
# 	year: 2019
# )

# #9
# Artist.create(
# 	name: "会田 誠",
# 	place: "東京都",
# 	birth_year: 1965,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 9,
# 	name: "NEO 出島",
# 	year: 2019
# )

# #10
# Artist.create(
# 	name: "経済産業省"
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 10,
# 	name: "2025 年大阪・関西万博誘致計画案",
# 	year: 2019
# )

# #11
# Artist.create(
# 	name: "五十嵐太郎",
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 11,
# 	name: "映画にみる未来都市",
# 	year: 2019
# )

# #12
# Artist.create(
# 	name: "アリババグループグリーティングチーム",
# 	place: "中国浙江省杭州市",
# 	birth_year: 1993,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 12,
# 	name: "中国杭州市のライフストリーム",
# 	year: 2019
# )

# #13
# Artist.create(
# 	name: "山梨知彦＋Loose Interface プロジェクト・チーム（日建設計）",
# 	place: "東京",
# 	birth_year: 1900,
# )
# Art.create(
# 	exhibition_id: 2,
# 	artist_id: 13,
# 	name: "Loose（ルーズな）Interface（インターフェイス）：もう一つの世界の誕生と、ティンバーインターフェイスの可能性",
# 	year: 2019
# )

User.find(1).update(username: "jumpe123oon", display_name: "Jumpei Sogawa", bio: "よろしくです。\nモネが好き", image: "http://pictogram2.com/p/p0146/i/m.png")
User.find(2).update(username: "kaitoharitaya", display_name: "Kaito", bio: "他人のログ見る専門", image: "http://pictogram2.com/p/p0751/i/m.png")