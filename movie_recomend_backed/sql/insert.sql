-- 切换到 movie 数据库
USE movie;


-- 插入用户数据 (中文)
INSERT INTO movie_user (username, password, avatar, nickname)
VALUES
('zhangsan', 'password1', 'https://www.helloimg.com/i/2024/12/25/676ba9944024e.png', '张三'),
('lisi', 'password2', 'https://www.helloimg.com/i/2024/12/25/676ba9944024e.png', '李四'),
('wangwu', 'password3', 'https://www.helloimg.com/i/2024/12/25/676ba9944024e.png', '王五');

-- 插入电影数据 (中文)
INSERT INTO movie (title, genre, director, release_date, poster, profile, link)
VALUES
('肖申克的救赎', '剧情', '弗兰克·德拉邦特', '1994-09-22', 'https://www.helloimg.com/i/2024/12/25/676baa9bac17c.jpg', '两个囚犯多年的友谊和希望的故事.', 'https://movie.douban.com/subject/1292052/'),
('蝙蝠侠：黑暗骑士', '动作', '克里斯托弗·诺兰', '2008-07-18', 'https://www.helloimg.com/i/2024/12/25/676bac2c4766a.jpg', '蝙蝠侠与小丑之间的正邪较量。', 'https://movie.douban.com/subject/1851857/'),
('盗梦空间', '科幻', '克里斯托弗·诺兰', '2010-07-16', 'https://www.helloimg.com/i/2024/12/25/676bab8a88d9c.jpg', '通过梦境分享技术进行盗窃的故事。', 'https://movie.douban.com/subject/3541415/'),
('星际穿越', '科幻', '克里斯托弗·诺兰', '2014-11-07', 'https://www.helloimg.com/i/2024/12/25/676bac957f468.jpg', '为了人类的未来，一支团队穿越虫洞探索新家园。', 'https://movie.douban.com/subject/1889243/'),
('阿甘正传', '爱情/传记', '罗伯特·泽米吉斯', '1994-07-06', 'https://www.helloimg.com/i/2024/12/25/676bad055aa54.jpg', '一位低智商但善良且执着的男子的非凡人生。', 'https://movie.douban.com/subject/1292720/');

-- 插入评论数据 (中文)
INSERT INTO movie_review (user_id, movie_id, content)
VALUES
(1, 1, '这是一部令人动容的电影，值得一看！'),
(2, 2, '小丑的表演太精彩了，电影节奏也非常棒！'),
(3, 3, '视觉效果震撼，剧情超级烧脑！'),
(1, 4, '情感丰富，关于宇宙和时间的探讨很深刻。'),
(2, 5, '阿甘的故事让我感受到人生的多样性和可能性！');

-- 插入收藏数据 (中文)
INSERT INTO favorite_movie (user_id, movie_id)
VALUES
(1, 1), -- 张三收藏了电影《肖申克的救赎》
(1, 3), -- 张三收藏了电影《盗梦空间》
(2, 2), -- 李四收藏了电影《蝙蝠侠：黑暗骑士》
(2, 4), -- 李四收藏了电影《星际穿越》
(3, 5); -- 王五收藏了电影《阿甘正传》