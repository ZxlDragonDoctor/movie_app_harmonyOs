use movie;

-- 插入新的电影数据
INSERT INTO movie (title, genre, director, release_date, poster, profile, link)
VALUES
    ('复仇者联盟', '科幻/动作', '安东尼·罗素', '2019-04-24', 'https://www.helloimg.com/i/2024/12/25/676bade3f93d2.jpg', '复仇者联盟与灭霸展开最后一战，为了拯救宇宙，所有英雄联合起来。', 'https://movie.douban.com/subject/26754938/'),
    ('侏罗纪公园', '科幻/冒险', '史蒂文·斯皮尔伯格', '1993-06-11', 'https://www.helloimg.com/i/2024/12/25/676babfc6be4d.jpg', '基因重组技术复生恐龙，科学家在恐龙乐园面临巨大的生死挑战。', 'https://movie.douban.com/subject/1291546/'),
    ('当幸福来敲门', '剧情/传记', '加布里埃尔·穆奇诺', '2006-12-15', 'https://www.helloimg.com/i/2024/12/25/676baefed3bc9.jpg', '一位单亲父亲努力奋斗，带着儿子克服生活中的艰难困境。', 'https://movie.douban.com/subject/1836418/'),
    ('美丽人生', '剧情/战争', '罗伯托·贝尼尼', '1997-12-20', 'https://www.helloimg.com/i/2024/12/25/676bad90a3b64.jpg', '犹太父亲为了保护儿子，假装将纳粹集中营变成游戏。', 'https://movie.douban.com/subject/1292062/'),
    ('神奇女侠', '动作/冒险', '帕蒂·詹金斯', '2017-06-02', 'https://www.helloimg.com/i/2024/12/25/676bac5dcb254.jpg', '来自神秘岛屿的女战士，勇敢挑战二战中的邪恶势力。', 'https://movie.douban.com/subject/26787640/');

-- 插入新的电影数据
INSERT INTO movie (title, genre, director, release_date, poster, profile, link)
VALUES
    ('蜘蛛侠', '动画/动作', '鲍勃·佩尔西凯蒂', '2018-12-14', 'https://www.helloimg.com/i/2024/12/27/676df7104ddb2.png', '讲述了多元宇宙中的蜘蛛侠团队合作打败敌人。', 'https://movie.douban.com/subject/26374197/'),
    ('星球大战', '科幻/动作', 'J·J·艾布拉姆斯', '2015-12-18', 'https://www.helloimg.com/i/2024/12/27/676df73ce933e.png', '在帝国倒塌后，新一代的英雄与新的黑暗势力展开战斗。', 'https://movie.douban.com/subject/20326665/'),
    ('黑豹', '动作/科幻', '瑞恩·库格勒', '2018-02-16', 'https://www.helloimg.com/i/2024/12/27/676df7702d5a1.png', '瓦坎达国王黑豹在守护家园与全球安全之间的选择。', 'https://movie.douban.com/subject/6390825/'),
    ('死侍', '动作/喜剧', '蒂姆·米勒', '2016-02-12', 'https://www.helloimg.com/i/2024/12/27/676df7c24e6ac.png', '讲述了一个超级英雄的另类故事，具有讽刺性与黑暗幽默。', 'https://movie.douban.com/subject/3718279/'),
    ('疯狂麦克斯', '动作/科幻', '乔治·米勒', '2015-05-15', 'https://www.helloimg.com/i/2024/12/27/676df893531e9.png', '荒凉的未来，末日幸存者为生存展开了疯狂的战斗。', 'https://movie.douban.com/subject/3592854/');

-- 插入新的电影数据
INSERT INTO movie (title, genre, director, release_date, poster, profile, link)
VALUES
    ('绿皮书', '剧情/传记', '彼得·法雷里', '2018-11-21', 'https://www.helloimg.com/i/2024/12/27/676dfa1f0f34c.png', '讲述了黑人钢琴家与白人司机在美国南部巡演时的友谊与挑战。', 'https://movie.douban.com/subject/27060077/'),
    ('海上钢琴师', '剧情/音乐', '朱塞佩·托纳多雷', '1998-10-28', 'https://www.helloimg.com/i/2024/12/27/676dfabd5261d.png', '一位天才钢琴师的传奇人生，他从未离开过船上的钢琴。', 'https://movie.douban.com/subject/1292001/'),
    ('千与千寻', '动画/奇幻', '宫崎骏', '2001-07-20', 'https://www.helloimg.com/i/2024/12/27/676dfb0ea0fe6.png', '讲述了小女孩千寻在异世界中的冒险，以及她与众多神灵的互动。', 'https://movie.douban.com/subject/1291561/'),
    ('英雄', '剧情/战争', '张艺谋', '2002-10-24', 'https://www.helloimg.com/i/2024/12/27/676dfb405ab1e.png', '古代中国的英雄故事，讲述了刺客与国家命运的复杂关系。', 'https://movie.douban.com/subject/1306123/'),
    ('盗火线', '犯罪/剧情', '迈克尔·曼', '1995-12-15', 'https://www.helloimg.com/i/2024/12/27/676dfb62e1266.png', '警察与职业犯罪分子之间的较量，剧情紧张，节奏感十足。', 'https://movie.douban.com/subject/1295686/');

-- 插入新的电影数据
INSERT INTO movie (title, genre, director, release_date, poster, profile, link)
VALUES
    ('疯狂动物城', '动画/冒险', '拜伦·霍华德', '2016-03-17', 'https://www.helloimg.com/i/2024/12/27/676dfcf66ed42.png', '在动物们的城市里，兔子警官和狐狸骗子联手破案，揭示了偏见与多样性的主题。', 'https://movie.douban.com/subject/25662329/'),
    ('战狼2', '动作/战争', '吴京', '2017-07-27', 'https://www.helloimg.com/i/2024/12/27/676dfd5235c23.png', '中国特种兵赴非洲执行任务，展开激烈的生死较量，保卫国家与人道主义的行动。', 'https://movie.douban.com/subject/26363254/'),
    ('黑鹰坠落', '战争/历史', '雷德利·斯科特', '2001-11-09', 'https://www.helloimg.com/i/2024/12/27/676dfd78bd34b.png', '讲述1993年摩加迪沙战斗的真实故事，突显士兵们的英勇与牺牲。', 'https://movie.douban.com/subject/1291824/'),
    ('勇敢的心', '剧情/历史', '梅尔·吉布森', '1995-05-24', 'https://www.helloimg.com/i/2024/12/27/676dfda056801.png', '苏格兰勇士威廉·华莱士领导民众反抗英格兰的统治，捍卫自由与正义。', 'https://movie.douban.com/subject/1294639/'),
    ('极限特工', '动作/冒险', 'D·J·卡卢索', '2017-01-20', 'https://www.helloimg.com/i/2024/12/27/676dfdc6aebdb.png', '极限特工重新回归，面对全球性的威胁，展开一场全新的冒险之旅。', 'https://movie.douban.com/subject/3230115/');

-- 插入新的电影数据
INSERT INTO movie (title, genre, director, release_date, poster, profile, link)
VALUES
    ('伦敦陷落', '动作', '巴巴克·纳加非', '2016-04-08', 'https://www.helloimg.com/i/2024/12/27/676dffdcddf92.png', '班宁是美国特勤局的特工，最近，他接到了一个重要的任务，护送总统本杰明参加英国首相的葬礼。而对于班宁来说，最要紧的任务，便是护送总统，回到国内', 'https://movie.douban.com/subject/25757186/'),
    ('银翼杀手', '科幻/惊悚', '里德利·斯科特', '1982-06-25', 'https://www.helloimg.com/i/2024/12/27/676e008884492.png', '在未来世界，一名警察追捕人造人，并逐渐质疑自己与人类的关系。', 'https://movie.douban.com/subject/10512661/'),
    ('蝴蝶效应', '科幻/悬疑', '埃里克·布雷斯', '2004-01-23', 'https://www.helloimg.com/i/2024/12/27/676e00bd09ace.png', '主人公发现自己可以回到过去改变一些小事，然而改变后所带来的后果却变得不可预测。', 'https://movie.douban.com/subject/1292343/'),
    ('勇敢者游戏', '动作/冒险', '杰克·卡斯丹', '2017-12-20', 'https://www.helloimg.com/i/2024/12/27/676e011b99aff.png', '四个朋友进入虚拟游戏世界，必须挑战各种障碍，才能回到现实世界。', 'https://movie.douban.com/subject/26586766/'),
    ('地心引力', '科幻/剧情', '阿方索·卡隆', '2013-10-04', 'https://www.helloimg.com/i/2024/12/27/676e01509b336.png', '一名宇航员在太空中遭遇事故，孤身漂浮，展开生死搏斗，生还的希望微乎其微。', 'https://movie.douban.com/subject/3793783/');

